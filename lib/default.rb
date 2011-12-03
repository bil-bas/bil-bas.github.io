# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'date'
require 'hpricot'

def pretty_date(date)
  return "bad date" unless date
  date.strftime("%A, %e %b %Y")
end

# Needed so we get a trailing /
def link_for_tag(tag, base_url)
  %[<a href="#{h base_url}#{h tag}/" rel="tag">#{h tag}</a>]
end

class Nanoc3::Item
  def summary
    # Just include the first paragraph.
    Hpricot(compiled_content).at("p").to_html
  end

  def year; self[:created_at].year; end
  def month; self[:created_at].month; end
  def day; self[:created_at].day; end

  def created_at; self[:created_at] || raise(path); end
  def modified_at; self[:modified_at] || created_at; end

  def title; self[:title]; end
  def kind; self[:kind]; end

  def article?; kind == 'article'; end
  def project?; kind == 'project'; end

  def name; File.basename(identifier); end
end