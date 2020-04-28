# frozen_string_literal: true

class Printer
  attr_accessor :values

  TOP_BORDER = "+-----------------+"
  BOTTOM_BORDER = "+--+----+---------+"

  def initialize(values)
    @values = values
  end

  def print
    puts(TOP_BORDER)

    @values.each do |row|
      longest_column = row.max_by(&:length)
      longest_column.each_with_index do |value, index|
        result = row_for_print(row, longest_column, index, value).join("|")

        puts("|#{result}|")
      end

      puts(BOTTOM_BORDER)
    end
  end

  private

  def row_for_print(row, longest_column, index, value)
    row.each_with_object([]) do |column, memo|
      memo << if column == longest_column
                value
              elsif column[index]
                column[index]
              else
                " ".rjust(column.length + 1)
              end
    end
  end
end
