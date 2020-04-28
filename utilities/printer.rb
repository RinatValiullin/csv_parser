# frozen_string_literal: true

class Printer
  attr_accessor :rows

  TOP_BORDER = "+-----------------+"
  BOTTOM_BORDER = "+--+----+---------+"

  def initialize(rows)
    @rows = rows
  end

  def print
    puts(TOP_BORDER)

    rows.each do |row|
      longest_cell = row.max_by(&:length)
      longest_cell.each_with_index do |_, index|
        result = row_for_print(row, index).join("|")

        puts("|#{result}|")
      end

      puts(BOTTOM_BORDER)
    end
  end

  private

  def row_for_print(row, index)
    row.each_with_object([]) do |cell, memo|
      memo << if cell[index]
                cell[index]
              else
                " ".rjust(cell[0].length)
              end
    end
  end
end
