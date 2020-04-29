# frozen_string_literal: true

Dir["./decorators/rows_decorator.rb", "./utilities/*.rb"].sort.each { |file| require file }

describe DecoratedRowsComposer do
  it "#compose" do
    file_reader = FileReader.new("spec/support/without_duplicate_type.csv")
    file_data = FileData.new(file_reader.read)
    decorated_rows = RowsDecorator.new(file_data.values_by_columns).decorate(file_data.types)
    composer = DecoratedRowsComposer.new(decorated_rows, file_data.data.length)
    composer.compose

    expected_data = [[[" 1"], ["aaa", "bbb", "ccc"], ["1 000.33"]], [[" 5"], ["aaaa", "bbb "], ["0.01"]], [["13"], ["aa  ", "bbbb"], ["10 000.00"]]]
    expect(composer.composed_rows).to eql expected_data
  end
end
