# frozen_string_literal: true

class FileData
  attr_accessor :data

  def initialize(data)
    if data == [""]
      puts("Blank file")
      exit
    end

    @data = data
  end

  def types
    @types ||= @data[0].split(";")
  end

  def values
    if @data[1..@data.length].empty?
      puts "There are no data for print"
      exit
    end

    @values ||= @data[1..@data.length]
  end

  def values_sorted_by_type
    values.each_with_object([]) do |row, array|
      columns = row.split(";")

      columns.each_with_index do |value, index|
        array[index] ||= []
        array[index] << value
      end
    end
  end
end
