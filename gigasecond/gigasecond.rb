class Gigasecond
  GIGA = 1_000_000_000

  def self.from(birthdate)
    birthdate + GIGA
  end
end
