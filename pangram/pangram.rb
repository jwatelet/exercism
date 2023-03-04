class Pangram
  ALPHABET = ('a'..'z').to_a.join

  def self.pangram?(sentence)
    sentence.downcase
            .gsub(/[\s\d_".]+/, '')
            .chars
            .tally
            .keys
            .sort
            .join == ALPHABET
  end
end
