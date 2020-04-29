# frozen_string_literal: true

require "./decorators/columns_decorator.rb"
require "./utilities/file_reader.rb"
require "./utilities/file_data.rb"

describe ColumnsDecorator do
  it "#decorate" do
    file_reader = FileReader.new("spec/support/without_duplicate_type.csv")
    file_data = FileData.new(file_reader.read)

    expected_data = [[[" 1"], [" 5"], ["13"]], [["aaa ", "bbb ", "ccc "], ["aaaa", "bbb "], ["aa  ", "bbbb"]], [[" 1 000.33"], ["     0.01"], ["10 000.00"]]]

    expect(ColumnsDecorator.new(file_data.values_by_columns).decorate(file_data.types)).to eql expected_data
  end
end
