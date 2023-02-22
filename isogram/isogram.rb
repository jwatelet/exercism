class Isogram
  def self.isogram?(word)
    word.downcase
        .chars
        .reject { |char| ['-', ' '].include?(char) }
        .tally
        .all? { |_k, v| v == 1 }
  end
end
