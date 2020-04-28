# frozen_string_literal: true

class FileReader
  attr_accessor :path

  def initialize(path)
    unless path
      puts "Please, enter path to the file"
      exit
    end

    @path = path
  end

  def file
    @file ||= File.open(path)
  rescue StandardError => e
    puts e
    exit
  end

  def read
    file.readlines.map(&:chomp)
  rescue StandardError => e
    puts e
    exit
  end
end
