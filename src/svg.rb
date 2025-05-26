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
    viewBox=\"0 0 #{@width} #{@height}\">\n
  SVG
    @is_finished = false
  end

  def finish_svg
    @buffer << "\n</svg>\n"
    @is_finished = true
  end

  def print
    if @is_finished
      puts @buffer
    else
      raise StandardError, "document not finished"
    end
  end

  def write(filename)
    if @is_finished
      File.open(filename, 'w') do |f|
        f.write(@buffer)
      end
    else
      raise StandardError, "document not finished"
    end
  end

  def add_circle(cx, cy, r,
        fill: "", fill_opacity: "",
        stroke: "", stroke_width: "", stroke_opacity: "",
        id: "", css: "", style: "")

    if @is_finished
      raise StandardError, "document already finished"
    end
    if fill != ""
      fill = " fill=\"#{fill}\""
    end
    if fill_opacity != ""
      fill_opacity = " fill-opacity=\"#{fill_opacity}\""
    end
    if stroke != ""
      stroke = " stroke=\"#{stroke}\""
    end
    if stroke_width != ""
      stroke_width = " stroke-width=\"#{stroke_width}\""
    end
    if stroke_opacity != ""
      stroke_opacity = " stroke-opacity=\"#{stroke_opacity}\""
    end
    if style != ""
      style = " style=\"#{style}\""
    end
    if css != ""
      css = " css=\"#{css}\""
    end
    if id != ""
      id = " id=\"#{id}\""
    end

    str = "<circle cx=\"#{cx}\" cy=\"#{cy}\" r=\"#{r}\""
    str += fill + fill_opacity + stroke + stroke_width + stroke_opacity
    str += id + css + style

    @buffer << str + " />\n"
  end

  def add_rect(x, y, width, height,
        fill: "", fill_opacity: "",
        stroke: "", stroke_width: "", stroke_opacity: "",
        id: "", css: "", style: "")

    if @is_finished
      raise StandardError, "document already finished"
    end
    if fill != ""
      fill = " fill=\"#{fill}\""
    end
    if fill_opacity != ""
      fill_opacity = " fill-opacity=\"#{fill_opacity}\""
    end
    if stroke != ""
      stroke = " stroke=\"#{stroke}\""
    end
    if stroke_width != ""
      stroke_width = " stroke-width=\"#{stroke_width}\""
    end
    if stroke_opacity != ""
      stroke_opacity = " stroke-opacity=\"#{stroke_opacity}\""
    end
    if style != ""
      style = " style=\"#{style}\""
    end
    if css != ""
      css = " css=\"#{css}\""
    end
    if id != ""
      id = " id=\"#{id}\""
    end

    str = "<rect x=\"#{x}\" y=\"#{y}\" width=\"#{width}\" height=\"#{height}\""
    str += fill + fill_opacity + stroke + stroke_width + stroke_opacity
    str += id + css + style

    @buffer << str + " />\n"
  end

end

