class FileData
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def types
    @data_types ||= @data[0].split(";")
  end

  def values
    @data_values ||= @data[1..@data.length]
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
