# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'date'
require 'hpricot'

def pretty_date(date)
  return "bad date" unless date
  date.strftime("%a, %e %b %Y")
end

# Needed so we get a trailing /
def link_for_tag(tag, base_url)
  %[<a href="#{h base_url}#{h tag}/" rel="tag">#{h tag}</a>]
end
