class Acronym
  def self.abbreviate(phrase)
    phrase.split(/[ -]/)
          .map { |word| word.upcase.chars.first }
          .join
  end
end
