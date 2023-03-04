class ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.color_code(color_code)
    COLORS.find_index(color_code)
  end
end
