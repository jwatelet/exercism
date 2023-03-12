class FlattenArray
  class << self
    def flatten(array)
      array.flatten
           .compact
    end
  end
end
