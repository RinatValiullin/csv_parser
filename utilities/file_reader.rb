# frozen_string_literal: true

class FileReader
  attr_accessor :path

  def initialize(path)
    raise "Please, enter path to the file" unless path

    @path = path
  end

  def read
    raise "Path is directory" if File.directory?(path)
    raise "File isn't .csv" if File.extname(path) != ".csv"
    raise "File is empty or not exist" if file_empty?(path)

    file.readlines.map(&:chomp)
  end

  private

  def file
    @file ||= File.open(path)
  end

  def file_empty?(file_path)
    !(File.file?(file_path) && !File.zero?(file_path))
  end
end
