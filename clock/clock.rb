class Clock
  attr_reader :minute, :hour

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
    normalize
  end

  def to_s
    "#{hour_to_s}:#{minute_to_s}"
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  def hash
    [self.class, @hour, @minute].hash
  end

  private

  def normalize
    @hour += @minute / 60 if @minute >= 60 || @minute.negative?
    @hour = @hour % 24 if @hour >= 24 || @hour.negative?
    @minute = @minute % 60
  end

  def hour_to_s
    @hour.to_s.rjust(2, '0')
  end

  def minute_to_s
    @minute.to_s.rjust(2, '0')
  end
end
