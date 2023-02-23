class Luhn
  attr_reader :luhn_number

  def initialize(luhn_number)
    @luhn_number = normalize(luhn_number)
  end

  class << self
    def valid?(luhn_number)
      new(luhn_number).valid?
    end
  end

  def digits
    @digits ||= luhn_number.chars.map(&:to_i)
  end

  def doubled_digits
    digits
      .reverse
      .map.with_index do |digit, index|
      digit = double digit if index.odd?
      digit
    end
  end

  def sum
    doubled_digits.sum
  end

  def too_short?
    luhn_number.length <= 1
  end

  def invalid_characters?
    luhn_number =~ /\D/
  end

  def valid?
    return false if too_short?
    return false if invalid_characters?

    (sum % 10).zero?
  end

  private

  def double(digit)
    digit *= 2
    digit -= 9 if digit > 9
    digit
  end

  def normalize(luhn_number)
    String(luhn_number).gsub(/\s/, '')
  end
end
