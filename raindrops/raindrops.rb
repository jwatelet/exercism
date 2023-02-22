class Raindrops
  def self.convert(number)
    return_value = ''
    return_value += 'Pling' if (number % 3).zero?
    return_value += 'Plang' if (number % 5).zero?
    return_value += 'Plong' if (number % 7).zero?

    return_value += number.to_s if return_value.empty?

    return_value
  end
end
