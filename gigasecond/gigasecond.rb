class Gigasecond
  GIGA = 1_000_000_000

  def self.from(birthdate)
    birthdate.to_i + GIGA
  end
end
