class Image

  def initialize(arr)
    @image = arr
  end

  def output_image
    @image.each do |a|
      puts a.join
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image