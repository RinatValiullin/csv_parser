# frozen_string_literal: true

begin
  Dir["./decorators/columns_decorator.rb", "./utilities/*.rb"].sort.each { |file| require file }

  file_reader = FileReader.new(ARGV[0])

  file_data = FileData.new(file_reader.read)
  columns_decorator = ColumnsDecorator.new(file_data.values_by_columns)

  decorated_columns = columns_decorator.decorate(file_data.types)
  decorated_rows_composer = DecoratedRowsComposer.new(decorated_columns, file_data.data.length)
  decorated_rows_composer.compose

  Printer.new(decorated_rows_composer.composed_rows).print
rescue StandardError => e
  puts(e)
end
