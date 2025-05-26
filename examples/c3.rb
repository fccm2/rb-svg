require_relative '../src/svg.rb'

srand(3210)

my_doc = Svg.new(240, 180)

# Create 8 random circles
8.times do
  r = rand(6..32)
  cx = rand(0..240)
  cy = rand(0..180)
  my_doc.add_circle(cx, cy, r, fill: "#0FF", stroke: "#F0F", stroke_width: "3")
end

my_doc.finish_svg
my_doc.print

