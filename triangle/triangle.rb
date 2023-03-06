class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    @sides.uniq.size <= 1 && valid?
  end

  def isosceles?
    @sides.uniq.size <= 2 && valid?
  end

  def scalene?
    @sides.uniq.size == 3 && valid?
  end

  def valid?
    @sides.all?(&:positive?) && @sides.permutation(3).all? { |(a, b, c)| a <= b + c }
  end
end
