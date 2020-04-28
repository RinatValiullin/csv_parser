class FileData
  attr_accessor :data

  def initialize(data)
    if data.length == 0
      puts("Blank file")
      exit
    end

    @data = data
  end

  def types
    @data_types ||= @data[0].split(";")
  end

  def values
    @data_values ||= @data[1..@data.length]

    if @data_values.length == 0
      puts "There are no data for print"
      exit
    end
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
