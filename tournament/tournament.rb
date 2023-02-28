require 'ostruct'

class Tournament
  HEADER = "Team                           | MP |  W |  D |  L |  P\n".freeze

  def initialize(input)
    @table = {}

    input.split("\n").each { |line| parse_line(line) }
  end

  def parse_line(line)
    local, visitor, result = line.strip.split(';')

    @table[local] = Team.new(local) if @table[local].nil?
    @table[visitor] = Team.new(visitor) if @table[visitor].nil?

    case result
    when 'win'
      @table[local].win!
      @table[visitor].loss!
    when 'loss'
      @table[local].loss!
      @table[visitor].win!
    when 'draw'
      @table[local].draw!
      @table[visitor].draw!
    end
  end

  def tally
    redered_lines = @table.values
                          .sort_by { |t| [-t.point, t.team_name] }
                          .map(&:to_s)
                          .join("\n")

    if @table.empty?
      HEADER
    else
      "#{HEADER}#{redered_lines}\n"
    end
  end

  class << self
    def tally(input)
      Tournament.new(input).tally
    end
  end

  class Team
    attr_reader :team_name

    def initialize(team_name)
      @team_name = team_name
      @win = 0
      @loss = 0
      @draw = 0
    end

    def point
      @win * 3 + @draw
    end

    def played
      @win + @draw + @loss
    end

    def win!
      @win += 1
    end

    def loss!
      @loss += 1
    end

    def draw!
      @draw += 1
    end

    def to_s
      "#{team_name_to_s}| #{played_to_s}| #{win_to_s}| #{draw_to_s}| #{loss_to_s}| #{point_to_s}"
    end

    private

    def point_to_s
      point.to_s.rjust(2)
    end

    def loss_to_s
      @loss.to_s.center(3)
    end

    def draw_to_s
      @draw.to_s.center(3)
    end

    def win_to_s
      @win.to_s.center(3)
    end

    def team_name_to_s
      team_name.ljust(31)
    end

    def played_to_s
      played.to_s.center(3)
    end
  end
end
