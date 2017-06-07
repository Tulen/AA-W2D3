# require 'byebug'

class Array
  def remove_dupes
    output = []
    self.each {|el| output << el unless output.include?(el)}
    output
  end

  def two_sum
    out = []
    self.each_index do |i|
      self.each_index do |j|
        out << [i,j] if (self[i] + self[j]).zero? && j > i
      end
    end
    out
  end

  def my_transpose
    reference = self.dup
    reference.each_index do |i|
      reference.each_index do |j|
        reference[i][j], reference[j][i] = reference[j][i], reference[i][j] unless j > i
      end
    end
    reference
  end


  def stock_picker
    output = []
    price_dup = dup
    min_price, max_price = price_dup.min, price_dup.max
    while output.empty?
      if price_dup.index(min_price) < price_dup.index(max_price)
        output.concat([price_dup.index(min_price), price_dup.index(max_price)])
      else
        price_dup.delete
      end
    end
    output
  end
end
