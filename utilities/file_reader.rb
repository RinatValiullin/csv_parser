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
    begin
      @file ||= File.open(path)
    rescue
      puts "File not exist"
      exit
    end
  end

  def read
    file.readlines.map(&:chomp)
  end
end
