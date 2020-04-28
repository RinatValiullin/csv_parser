Dir["./decorators/*.rb"].each {|file| require file }

TYPES = {
  "int" => IntDecorator,
  "string" => StringDecorator,
  "money" => MoneyDecorator
}

path = ARGV[0]

file = File.open(path)

file_data = file.readlines.map(&:chomp)

data_types = file_data[0].split(";")

data_hash = []

file_data[1..file_data.length].each do |row|
  values = row.split(";")
  values.each_with_index do |value, index|
    data_hash[index] ||= []
    data_hash[index] << value
  end
end



data_hash.each_with_index do |values, index|
  type = data_types[index]
  data_hash[index] = TYPES[type].new(values).decorate
end
parsed_rows = []


(file_data.length-1).times do |index|
  data_hash.each do |values|
    parsed_rows[index] ||= []
    if values[index].kind_of?(Array)
      parsed_rows[index] << values[index]
    else
      parsed_rows[index] << [values[index]]
    end
  end
end

puts "+-----------------+"
parsed_rows.each do |row|
  max_string_value = row.select { |column| column.kind_of?(Array) }.max_by(&:length)
  max_string_value.each_with_index do |value, index|
    test_value = "|"
    row.each do |column|
      if column == max_string_value
        test_value += value + "|"
        next
      end
      unless column[index]
        test_value += "|".rjust(column[0].length+1)
        next
      end

      test_value += column[index]
      test_value += "|"
    end
    test_value += "\n+--+----+---------+"
    puts(test_value)
  end
end
