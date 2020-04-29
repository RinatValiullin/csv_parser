# frozen_string_literal: true

class Printer
  attr_accessor :rows

  def initialize(rows)
    @rows = rows
  end

  def print
    print_top_border

    rows.each do |row|
      longest_cell = row.max_by(&:length)
      longest_cell.each_with_index do |_, index|
        result = row_for_print(row, index).join("|")

        puts("|#{result}|")
      end
      print_bottom_border(row)
    end
  end

  private

  def row_for_print(row, index)
    row.each_with_object([]) do |cell, memo|
      memo << (cell[index] || " ".rjust(cell[0].length))
    end
  end

  def print_top_border
    puts("+#{'-' * longest_row.length}+")
  end

  def print_bottom_border(row)
    bottom_border = longest_values_in_row(row).each_with_object(["+"]) do |value, memo|
      memo << ("-" * value.length)
      memo << "+"
    end

    puts(bottom_border.join(""))
  end

  def longest_row
    rows.map do |row|
      longest_values_in_row(row).join("|")
    end.max_by(&:length)
  end

  def longest_values_in_row(row)
    row.map { |column| column.max_by(&:length) }
  end
end
