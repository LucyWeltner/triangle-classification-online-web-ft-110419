class Triangle
  attr_accessor :length1, :length2, :length3
  
  def initialization(lengtha, lengthb, lengthc)
    @length1 = lengtha 
    @length2 = lengthb 
    @length3 = lengthc
  end 
  
  def kind
    positive_lengths == @length1 < 0 && @length2 < 0 && @length3 < 0 
    triangle_inequality == @length1 + @length2 > @length3 && @length3 + @length2 > @length1 && @length1 + @length3 > @length2
    if positive_lengths && triangle_inequality 
      if @length1 == @length2 && @length2 == @length3 
        return :equilateral 
      elsif @length1 != @length2 && @length1 != @length3 && @length2 != @length3
        return :scalene
      else 
        return :isosceles
      end 
    else 
      begin 
        raise TriangleError
      rescue TriangleError => an_error
        an_error.message 
      end
    end 
  end 
  
  class TriangleError < StandardError 
    def message 
      puts "Make sure your side lengths are all greater than 0, and the sum of the lengths of any two sides is greater than the length of the third side."
    end 
  end
end
