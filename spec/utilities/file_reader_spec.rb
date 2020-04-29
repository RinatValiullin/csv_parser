# frozen_string_literal: true

require "./utilities/file_reader.rb"

describe FileReader do
  it "print message if path is blank" do
    expect { FileReader.new(nil) }.to raise_error(RuntimeError, "Please, enter path to the file")
  end

  it "print message if path is blank" do
    expect { FileReader.new("spec").read }.to raise_error(RuntimeError, "Path is directory")
  end

  it "print message if file not csv" do
    expect { FileReader.new("test.jpeg").read }.to raise_error(RuntimeError, "File isn't .csv")
  end

  it "print message if file is blank" do
    expect { FileReader.new("spec/support/blank_file.csv").read }.to raise_error(RuntimeError, "File is empty or not exist")
  end

  it "return array of lines" do
    rows = FileReader.new("spec/support/without_duplicate_type.csv").read

    expect(rows).to eql ["int;string;money", "1;aaa bbb ccc;1000.33", "5;aaaa bbb;0.001", "13;aa bbbb;10000.00"]
  end
end
