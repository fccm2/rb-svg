require_relative '../src/svg.rb'

my_doc = Svg.new(240, 180)
my_doc.add_circle(100, 60, 12, fill: "#0FF")
my_doc.add_circle(120, 80, 16, fill: "none", stroke: "#F0F")
my_doc.finish_svg
my_doc.print

