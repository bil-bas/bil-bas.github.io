# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

Encoding.default_external = 'UTF-8'

require 'hpricot'

def pretty_date(date)
  return "bad date" unless date
  date.strftime("%A, #{date.mday.ordinal} %B %Y")
end

# Needed so we get a trailing /
def link_for_tag(tag, base_url)
  %[<a href="#{h base_url}#{h tag}/" rel="tag">#{h tag}</a>]
end

def home
  @home ||= @items.find(&:home?)
end


def nav_items
  @nav_items ||= [home] + @config[:nav_items].map do |identifier|
    home.children.find {|i| i.identifier == identifier }
  end
end

def sorted_news
  sorted_articles
end

def sorted_releases
  @sorted_releases ||= sorted_articles.select {|i| i.identifier =~ %r[^/\w+/\w+/releases/v] }
end

def sorted_blog_posts
  @sorted_blog_posts ||= sorted_articles.select {|i| i.identifier =~ %r[^/blog/_posts/] }
end

def breadcrumbs_for_path(path)
  @breadcrumbs_path_cache ||= {}
  @breadcrumbs_path_cache[path] ||= begin
    head = (path == '/' ? [] :  breadcrumbs_for_path(path.sub(/[^\/]+\/$/, '')) )
    tail = [ item_with_path(path) ]

    head + tail
  end
end

def item_with_path(path)
  @path_cache ||= {}
  @path_cache[path] ||= begin
    @items.find { |i| i.path == path }
  end
end

def breadcrumbs_trail
  breadcrumbs_for_path(@item.path)
end

def sorted_years
  @sorted_years ||= home.children.select {|i| i.identifier =~ %r[^/\d{4}/$] }.reverse
end

def sorted_months
  @sorted_months ||= sorted_years.inject([]) { |m, y| m.push *y.children.reverse }
end

def news_by_month
  @news_by_month ||= begin
    sorted_months.map do |month|
      year_num, month_num = month.parent.name.to_i, month.name.to_i
      [month, sorted_news.select {|i| i.year == year_num and i.month == month_num }]
    end
  end
end






