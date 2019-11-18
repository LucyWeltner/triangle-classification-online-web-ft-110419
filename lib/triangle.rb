class Triangle
  attr_accessor :length1, :length2, :length3
  
  def initialize(lengtha, lengthb, lengthc)
    @length1 = lengtha 
    @length2 = lengthb 
    @length3 = lengthc
  end 
  
  def kind
    positive_lengths = @length1 > 0 && @length2 > 0 && @length3 > 0 
    triangle_inequality = @length1 + @length2 > @length3 && @length3 + @length2 > @length1 && @length1 + @length3 > @length2
    if positive_lengths && triangle_inequality
      puts "It's a real triangle!"
      if @length1 == @length2 && @length2 == @length3 
        return :equilateral 
      elsif @length1 != @length2 && @length1 != @length3 && @length2 != @length3
        return :scalene
      else 
        return :isosceles
      end 
    else 
      puts "Not a valid triangle!"
      begin 
        raise TriangleError
      rescue TriangleError => an_error
        puts an_error.message 
      end
    end 
  end 
  
  class TriangleError < StandardError 
    def message 
      "Make sure your side lengths are all greater than 0, and the sum of the lengths of any two sides is greater than the length of the third side."
    end 
  end
end
