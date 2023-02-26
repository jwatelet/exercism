class TwelveDays
  SONG_LYRICS = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  NUMBER_OF_DAY = %w[
    first
    second
    third
    fourth
    fifth
    sixth
    seventh
    eighth
    ninth
    tenth
    eleventh
    twelfth
  ].freeze

  def self.song
    (0..SONG_LYRICS.length - 1).map do |step|
      lyrics = SONG_LYRICS.map
                          .with_index
                          .reject { |_, index| index > step }
                          .map { |part, _index| part }

      "On the #{NUMBER_OF_DAY[step]} day of Christmas my true love gave to me: #{lyric_to_sentence(lyrics.reverse)}."
    end.join("\n\n") + "\n"
  end

  def self.lyric_to_sentence(lyrics)
    *parts, last = lyrics

    if lyrics.length == 1
      last
    else
      "#{parts.join(', ')}, and #{last}"
    end
  end
end
