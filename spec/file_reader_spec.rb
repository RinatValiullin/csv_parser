# frozen_string_literal: true

require "./utilities/file_reader.rb"

describe FileReader do
  it "print message if path is blank" do
    expect { FileReader.new(nil) }.to output('Please, enter path to the file').to_stdout
  end

  it "print message if path is directory" do
    puts(123)
    expect { FileReader.new("spec") }.to output('Please, enter path to the file').to_stdout
  end
end
