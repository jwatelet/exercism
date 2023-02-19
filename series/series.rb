class Series
  def initialize(digits_str)
    @digits_str = digits_str
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @digits_str.length

    @digits_str.chars.each_cons(slice_length).map(&:join)
  end
end
