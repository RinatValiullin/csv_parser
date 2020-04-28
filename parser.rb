Dir["./decorators/row_decorator.rb", "./utilities/*.rb"].each {|file| require file }

file_reader = FileReader.new(ARGV[0])

file_data = FileData.new(file_reader.file.readlines.map(&:chomp))

data_values_sorted_by_type = file_data.values_sorted_by_type

decorated_rows = RowDecorator.new(data_values_sorted_by_type).decorate(file_data.types)

parsed_rows = []
file_data.values.length.times do |index|
  decorated_rows.each do |values|
    parsed_rows[index] ||= []
    parsed_rows[index] << values[index]
  end
end

Printer.new(parsed_rows).print
