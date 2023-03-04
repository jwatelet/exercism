class Complement
  DNA = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(sequence)
    sequence.chars
            .map { |c| COMPLEMENT[c] }.join
  end
end
