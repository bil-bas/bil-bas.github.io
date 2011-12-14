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
  @sorted_releases ||= sorted_articles.select(&:release?)
end

def sorted_releases_for project
  sorted_releases.select {|a| a.identifier =~ %r[/#{project.tr("_",'-')}-v\d] }
end

def sorted_blog_posts
  @sorted_blog_posts ||= sorted_articles.select(&:blog_post?)
end

def sorted_years
  @sorted_years ||= home.children.select {|i| i.identifier =~ %r[^/\d{4}/$] }.reverse
end

def sorted_months
  @sorted_months ||= sorted_years.inject([]) { |m, y| m.push *y.children.reverse }
end

def articles
  @items.select(&:article?)
end

def html_attributes(options)
  options.map {|k, v| "#{k}=#{v}"}.join "&"
end

