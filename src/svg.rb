class Svg
  def initialize(width, height, unit = "px")
    @width = width
    @height = height
    @unit = unit
    @buffer = <<~SVG
  <?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>
  <svg
    version=\"1.1\"
    baseProfile=\"full\"
    xmlns=\"http://www.w3.org/2000/svg\"
    width=\"#{@width}#{@unit}\"
    height=\"#{@height}#{@unit}\"
    viewBox=\"0 0 #{@width} #{@height}\">
  SVG
  end

  def finish_svg
    @buffer << "\n</svg>\n"
  end

  def write
    puts @buffer
  end
end

mon_doc = Svg.new(240, 180)
mon_doc.finish_svg
mon_doc.write

