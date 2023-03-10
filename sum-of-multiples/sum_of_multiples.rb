class SumOfMultiples
  def initialize(*args)
    @factors = args
  end

  def to(bound)
    (1..bound - 1).select { |num| @factors.any? { |i| num.modulo(i).zero? } }.sum
  end
end
