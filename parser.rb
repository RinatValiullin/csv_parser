Dir["./decorators/rows_decorator.rb", "./utilities/*.rb"].each {|file| require file }

file_reader = FileReader.new(ARGV[0])

file_data = FileData.new(file_reader.read)

data_values_sorted_by_type = file_data.values_sorted_by_type

decorated_rows = RowsDecorator.new(data_values_sorted_by_type).decorate(file_data.types)

decorated_rows_composer = DecoratedRowsComposer.new(decorated_rows, file_data.values.length)
decorated_rows_composer.compose

Printer.new(decorated_rows_composer.composed_rows).print
