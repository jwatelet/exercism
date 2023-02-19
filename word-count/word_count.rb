class Phrase
  def initialize(phrase_str)
    @phrase_str = phrase_str
  end

  def word_count
    @phrase_str.scan(/\b[\w']+\b/).map(&:downcase).tally
  end
end
