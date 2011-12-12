require "chunky_png"
require "oily_png"

class Thumbnailize < Nanoc3::Filter
  identifier :thumbnailize
  type       :binary

  def run(filename, params={})
    factor = params[:factor]

    image = ChunkyPNG::Image.from_file(filename)
    image.resample_nearest_neighbor! (image.width * factor).round, (image.height * factor).round

    image.save output_filename
  end
end