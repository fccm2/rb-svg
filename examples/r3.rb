require 'svg.rb'

srand(3210)

my_doc = Svg.new(240, 180)

# Générer 8 rectangles aléatoires
12.times do
  x = rand(0..240)
  y = rand(0..180)
  w = rand(12..56)
  h = rand(8..38)
  my_doc.add_rect(x, y, w, h, fill: "#06e", stroke: "#028", stroke_width: "3")
end

my_doc.finish_svg
my_doc.print

