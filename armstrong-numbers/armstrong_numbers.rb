class ArmstrongNumbers
  class << self
    def include?(number)
      number.digits
            .sum { |c| c.to_i**number.digits.count } == number
    end
  end
end
