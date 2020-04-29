# frozen_string_literal: true

require "./utilities/file_reader.rb"
require "./utilities/file_data.rb"

describe FileData do
  it "raise error if file contains only types" do
    file_reader = FileReader.new("spec/support/only_types.csv")

    expect { FileData.new(file_reader.read) }.to raise_error(RuntimeError, "There are no data for print")
  end

  it "#values_by_columns" do
    file_reader = FileReader.new("spec/support/without_duplicate_type.csv")

    expect(FileData.new(file_reader.read).values_by_columns).to eql [["1", "5", "13"], ["aaa bbb ccc", "aaaa bbb", "aa bbbb"], ["1000.33", "0.001", "10000.00"]]
  end
end
