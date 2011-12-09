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

def link_to(*args, &block)
  if block_given?
    raise ArgumentError, "Block version requires: path_or_rep, [attributes]" unless (1..2).include? args.size
    link_to capture(&block), *args

  else
    raise ArgumentError, "Non-block version requires: text, path_or_rep, [attributes]" unless (2..3).include? args.size

    # Find path
    text, path_or_rep, attributes = *args
    attributes ||= {}

    path = path_or_rep.is_a?(String) ? path_or_rep : path_or_rep.path

    # Join attributes
    attributes = attributes.inject('') do |memo, (key, value)|
      memo + key.to_s + '="' + h(value) + '" '
    end

    # Create link
    "<a #{attributes}href=\"#{path}\">#{text}</a>"
  end
end

def link_to_unless_current(*args, &block)
  if block_given?
    raise ArgumentError, "Block version requires: path_or_rep, [attributes]" unless (1..2).include? args.size
    link_to_unless_current capture(&block), *args

  else
    raise ArgumentError, "Non-block version requires: text, path_or_rep, [attributes]" unless (2..3).include? args.size

    # Find path
    text, path_or_rep, attributes = *args
    attributes ||= {}

    path = path_or_rep.is_a?(String) ? path_or_rep : path_or_rep.path

    if @item_rep and @item_rep.path == path
      # Create message
      attributes = attributes.merge :title => "You're here."
      if attributes.has_key? :class
        attributes[:class] += " active"
      else
        attributes[:class] = "active"
      end

      attributes = attributes.inject('') do |memo, (key, value)|
        memo + key.to_s + '="' + h(value) + '" '
      end

      "<span #{attributes}>#{text}</span>"
    else
      link_to(text, path_or_rep, attributes)
    end
  end
end

class Fixnum
  def ordinal
    if (10...20).include?(self) then
      self.to_s + 'th'
    else
      self.to_s + %w{th st nd rd th th th th th th}[self % 10]
    end
  end
end

class Nanoc3::Item
  def summary
    # Just include the first paragraph (article) or list (release).
    (Hpricot(compiled_content).at("p|ul") || "(empty article)").to_s
  end

  def feed_summary
    excerptize strip_html(compiled_content), length: 140
  end

  def home?; identifier == '/'; end

  def hidden?; self[:is_hidden]; end

  def year; self[:created_at].year; end
  def month; self[:created_at].month; end
  def month_name; Date::MONTHNAMES[month]; end
  def day; self[:created_at].day; end

  def created_at; self[:created_at] || raise(path); end
  def modified_at; self[:modified_at] || created_at; end

  def permalink; "http://spooner.github.com#{path}"; end
  def title; self[:title]; end
  def kind; self[:kind]; end
  def layout; self[:layout]; end

  # Page heading, as opposed to nav link.
  def full_title
    self[:full_title] || title
  end

  def article?; path =~ %r[^/\d{4}/\d{2}/[^/]+/$]; end
  def project?; identifier =~ %r[^/(?:games|libraries|utilities)/[^/]+/$]; end
  def blog_post?; article? and layout == 'blog_post'; end
  def release?; article? and layout == 'release'; end

  def name; File.basename(identifier); end

  def meta_keywords
    if layout == 'articles'
      "ruby game games software development programming ai graphics"
    elsif article?
      self[:tags].join " "
    end
  end

  def meta_description
    if layout == 'articles'
      "Spooner's game-making blog and project portfolio, focusing on Ruby development"
    else
      nil
    end
  end
end