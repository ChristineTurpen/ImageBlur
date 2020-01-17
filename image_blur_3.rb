class Image

  def initialize(image)
    @image = image

  end

# This method is for showing where are the ones in a row.
  def get_ones
    get_ones_arr = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == 1
          get_ones_arr << [row_index, col_index]
        end
      end
    end
    get_ones_arr
  end

  def blur!(distance)
    get_ones_arr = get_ones
    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        get_ones_arr.each do |x, y|

          if manhattan_distance(row_index, col_index, x, y) <= distance
            @image[row_index][col_index] = 1
          end
        end
      end
    end
  end

  def manhattan_distance(x1, y1, x2, y2)
    y_distance = (x2 - x1).abs
    x_distance = (y2 - y1).abs
    y_distance + x_distance
  end

#This method is for defining an image.
  def output_image
    @image.each do |row|
      puts row.join
  end
  end
end


image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 1]
])

image.output_image #original output
puts
image.blur!(3)

image.output_image #blurred output