# Client
class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    puts "Text: #{text}, Size: #{size}, Color: #{color}"
  end
end

# Adaptee
class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @string = string
    @size_mm = size_mm
    @colour = colour
  end
end

# Adapter
class BritishTextObjectAdapter
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.string
  end

  def size_inches
    @bto.size_mm / 25.4
  end

  def color
    @bto.colour
  end
end

bto = BritishTextObject.new('Example string', 1532, :black)
bto_adapter = BritishTextObjectAdapter.new(bto)
Renderer.new.render(bto_adapter)
