# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'date'

def pretty_date(date)
  Date.parse(date).strftime("%a, %e %b %Y")
end
