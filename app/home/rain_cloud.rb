# frozen_string_literal: true

# Draws the home page's rain cloud with block characters, with rows torn sideways, corrupted cells and data rain.
# Seeded so it looks the same on every render.
class RainCloud
  # A row of [character, colour] cells. Cells without a colour take the row's colour.
  Row = Data.define(:cells, :style) do
    def text = cells.map(&:first).join

    def html
      inner = cells.map { |char, color| color ? %(<span style="color: #{color}">#{char}</span>) : char }.join
      %(<span class="row"#{%( style="#{style}") if style}>#{inner}</span>)
    end
  end

  # A rectangle under the bumps with its corners rounded, as rows, columns and a corner radius.
  Base = Data.define(:rows, :cols, :corner)

  WIDTH = 50
  CLOUD_ROWS = 19
  RAIN_ROWS = 8

  # Bumps of the cloud as [column, row, radius]. Rows are stretched to make up for characters being taller than wide.
  BUMPS = [[25, 8, 11], [13, 12, 7.5], [37, 11, 8.5]].freeze
  ROW_STRETCH = 1.7

  BASE = Base.new(rows: 12..18, cols: 7..43, corner: 5)

  SHADES = %w[█ ▓].freeze
  CORRUPT = %w[▀ ▄ ▚ ▞ ▌ ▐].freeze
  RAIN = %w[│ ╎ ┊ ' ,].freeze
  BLANK = [' ', nil].freeze

  # Cloud rows torn sideways by a number of characters, like { 6 => 3 }. None for a clean outline.
  TEARS = {}.freeze

  def initialize(seed: 5, bumps: BUMPS, base: BASE, tears: TEARS, corrupt: 0.015)
    @random = Random.new(seed)
    @bumps = bumps
    @base = base
    @tears = tears
    @corrupt = corrupt
  end

  def rows
    cloud_rows + rain_rows
  end

  def html
    rows.map(&:html).join("\n")
  end

  private

  def cloud_rows
    CLOUD_ROWS.times.filter_map do |row|
      cells = WIDTH.times.map { |col| cell(col:, row:) }
      next if cells.all?(BLANK)

      shift = @tears[row]
      Row.new(cells: shift ? tear(cells, shift) : cells, style: nil)
    end
  end

  # Shifts a row sideways without wrapping, so what's pushed off the edge is lost.
  def tear(cells, shift)
    shift.positive? ? ([BLANK] * shift) + cells[0...-shift] : cells[-shift..] + ([BLANK] * -shift)
  end

  def cell(col:, row:)
    return BLANK unless inside?(col:, row:)
    return [CORRUPT.sample(random: @random), color(row:)] if @random.rand < @corrupt

    # Denser towards the bottom of the cloud, with some noise.
    depth = (row / CLOUD_ROWS.to_f) + @random.rand(-0.25..0.25)
    [SHADES[(1 - (depth * 2)).round.clamp(0, 1)], color(row:)]
  end

  # A random blue, lighter at the top of the cloud and darker at the bottom.
  def color(row:)
    light = (82 - (row * 2.4) + @random.rand(-12..12)).round.clamp(25, 90)
    "hsl(#{@random.rand(198..235)} #{@random.rand(65..100)}% #{light}%)"
  end

  def inside?(col:, row:)
    @bumps.any? { |x, y, radius| ((col - x)**2) + (((row - y) * ROW_STRETCH)**2) <= radius**2 } || base?(col:, row:)
  end

  def base?(col:, row:)
    return false unless @base.rows.cover?(row) && @base.cols.cover?(col)

    corner_row = row.clamp(*corner_rows)
    corner_col = col.clamp(@base.cols.begin + @base.corner, @base.cols.end - @base.corner)
    ((col - corner_col)**2) + (((row - corner_row) * ROW_STRETCH)**2) <= @base.corner**2
  end

  # Above and below these rows the base's corners curve in, reaching at most halfway up a short base.
  def corner_rows
    rows = @base.rows
    inset = [@base.corner / ROW_STRETCH, (rows.end - rows.begin) / 2.0].min
    [rows.begin + inset, rows.end - inset]
  end

  # Rain falls from some columns under the cloud, thinning out further down.
  def rain_rows
    columns = ((@base.cols.begin + 1)..(@base.cols.end - 1)).select { @random.rand < 0.6 }

    RAIN_ROWS.times.map do |row|
      cells = WIDTH.times.map do |col|
        columns.include?(col) && @random.rand < 0.9 - (row * 0.09) ? [RAIN.sample(random: @random), nil] : BLANK
      end

      Row.new(cells:, style: "--light: 70%; --opacity: #{(1 - (row * 0.11)).round(2)}")
    end
  end
end
