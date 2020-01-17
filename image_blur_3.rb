class Image

  def initialize(image)
    @image = image

  end

# This method finds where the ones are in the image
  def find_ones
    find_ones_arr = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == 1
          find_ones_arr << [row_index, col_index]
        end
      end
    end
    find_ones_arr
  end

  # This method changes the surrounding 0's to 1's
  def blur!(distance)
    find_ones_arr = find_ones
    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        find_ones_arr.each do |x, y|
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

# This method initiates the image
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

image.output_image #original image

puts
image.blur!(3)

image.output_image #blurred image