# frozen_string_literal: true

class FileReader
  attr_accessor :path

  def initialize(path)
    raise "Please, enter path to the file" unless path
    raise "File is empty" if file_empty?(path)

    @path = path
  end

  def read
    file.readlines.map(&:chomp)
  end

  private

  def file_empty?(path)
    !(File.file?(path) && !File.zero?(path))
  end

  def file
    @file ||= File.open(path)
  end
end
