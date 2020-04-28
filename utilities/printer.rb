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
      max_string_value = row.select { |column| column.kind_of?(Array) }.max_by(&:length)
      max_string_value.each_with_index do |value, index|
        test_value = "|"
        row.each do |column|
          if column == max_string_value
            test_value += value + "|"
            next
          end
          if column.kind_of?(Array)
            test_value += column[0] + "|"
            next
          end
          if index > 0
            test_value += "|".rjust(column.length+1)
            next
          end

          test_value += column + "|"
        end
        test_value += "\n"
        puts(test_value)
      end
      puts(BOTTOM_BORDER)
    end
  end
end
