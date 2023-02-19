class Hamming
  def self.compute(adn1, adn2)
    raise ArgumentError if adn1.length != adn2.length

    adn1.chars
        .zip(adn2.chars)
        .count { |a, b| a != b }
  end
end
