class Image

  def initialize(image)
    @image = image
  end

  def find_pixels
    find_pixels_arr = []

    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == 1
          find_pixels_arr << [row_index, col_index]
        end
      end
    end

    find_pixels_arr
  end

  def blur!
    find_pixels_arr = find_pixels
    @image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        find_pixels_arr.each do |x, y|

          if row_index == x && col_index == y
            @image[row_index -1][col_index] = 1 unless row_index == 0 #Above
            @image[row_index +1][col_index] = 1 unless row_index >= 3 #Below 
            @image[row_index][col_index -1] = 1 unless col_index == 0 #Left
            @image[row_index][col_index +1] = 1 unless col_index >= 3 #Right
          end

        end
      end
    end
  end


  def output_image
    @image.each do |row|
      puts row.join
    end
  end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image #original image

puts
image.blur!

image.output_image #blurred image