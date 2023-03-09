class Anagram
  def initialize(anagram)
    @anagram = anagram.downcase
  end

  def match(words)
    words.filter { |word| anagram?(word) }
  end

  def anagram?(word)
    word = word.downcase
    @anagram != word && sorted_chars(@anagram) == sorted_chars(word)
  end

  private

  def sorted_chars(word)
    word.chars.sort
  end
end
