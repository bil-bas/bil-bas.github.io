# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'date'
require 'hpricot'

def pretty_date(date)
  date.strftime("%a, %e %b %Y")
end
