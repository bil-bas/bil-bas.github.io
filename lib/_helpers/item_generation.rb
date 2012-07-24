module ItemGeneration
  def self.included(base)
    if defined? Nanoc3::CLI
      Nanoc3::CLI::Logger::ACTION_COLORS[:delete] = "\e[1m" + "\e[31m" # bold + red
      Nanoc3::CLI::Logger::ACTION_COLORS[:generate] = "\e[1m" + "\e[36m" # bold + cyan
    end
  end

  def log(message, type = nil)
    return unless defined? Nanoc3::CLI

    if type
      Nanoc3::CLI::Logger.instance.file(:high, type, message)
    else
      Nanoc3::CLI::Logger.instance.log(:high, message)
    end
  end

  def create_years_and_months
    log "Creating years and months..."

    # year => latest mtime of articles in that year
    years =  Hash.new  {|h, k| h[k] = Time.new 0 }
    # [year, month] => latest mtime of articles in that month
    months = Hash.new {|h, k| h[k] = Time.new 0 }

    sorted_articles.each do |article|
      year, month = article.year, article.month

      if article.mtime > years[year]
        years[year] = article.mtime
      end

      if article.mtime > months[[year, month]]
        months[[year, month]] = article.mtime
      end
    end

    years.each_pair do |year, mtime|
      create_item "/#{year}/", "",
          title: year.to_s,
          layout: 'year',
          count_comments: true,
          extension: 'md',
          articles_shown: "sorted_news",
          #filter_articles: true,
          mtime: mtime
    end

    months.each_pair do |(year, month), mtime|
      month_name = Date::MONTHNAMES[month]
      create_item "/#{year}/#{month.to_s.rjust(2, '0')}/", "",
          title: month_name,
          full_title: "#{month_name} #{year}",
          layout: 'month',
          count_comments: true,
          extension: 'md',
          mtime: mtime
    end
  end

  # http://www.h3rald.com/articles/take-back-your-site-with-nanoc/
  def create_tags
    log "Creating tags..."

    # Collect tag and page data
    # tag_name => { :count, :mtime }
    tags = Hash.new {|h, k| h[k] = { count: 0, mtime: Time.new(0)} }

    sorted_articles.each do |article|
      article.attributes[:tags].each do |tag|

        tags[tag][:count] += 1

        if article.mtime > tags[tag][:mtime]
          tags[tag][:mtime] = article.mtime
        end
      end
    end

    # Calculate the relative font size to render the tag at.
    min_tag_count, max_tag_count = tags.values.map {|d| d[:count] }.minmax
    tag_count_range = max_tag_count - min_tag_count

    # Write pages.
    tags.each_pair do |tag, data|
      # 0 to 1 for smallest to largest.
      tag_size = (data[:count] - min_tag_count) / tag_count_range.to_f
      create_item "/tags/#{tag}/", '',
          title: tag,
          layout: 'tag',
          count: data[:count],
          count_comments: true,
          extension: 'md',
          font_size: tag_size,
          mtime: data[:mtime]
    end
  end

  # A few pages need identical versions filtered by article type.
  def create_article_filters
    log "Creating filtered versions of article pages..."

    @items.select {|i| ["/", "/archives/"].include? i.identifier }.each do |index|
      {
          blog: ["spooner_blog", "Blog", "sorted_blog_posts"],
          releases: ["spooner_releases", "Releases", "sorted_releases"]
      }.each_pair do |filter, (feed, title, articles)|
        create_item "#{index.identifier}#{filter}/", index.raw_content,
            index.attributes.merge(
                title: title,
                nav_title: "#{title} only",
                feed_url: "http://feeds.feedburner.com/#{feed}",
                articles_shown: articles,
                filtered: true
            )
      end

    end
  end

  def remove_drafts
    log "Removing draft pages..."
    @items.delete_if do |item|
      if item.identifier =~ %r[_draft/$]
        log item.identifier, :delete
        true
      else
        false
      end
    end
  end

  def create_release_pages
    log "Creating project releases pages..."
    @items.select(&:project?).each do |item|
      identifier = "#{item.identifier}releases/"

      create_item identifier, "",
          title: "Releases",
          layout: "releases",
          count_comments: true,
          extension: "md",
          mtime: sorted_releases_for(item.parent.name).max(&:mtime)
    end
  end

  def create_item identifier, contents, attributes
    @items << Nanoc3::Item.new(contents, attributes, identifier)

    log identifier, :generate
  end
end