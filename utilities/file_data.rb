# frozen_string_literal: true

class FileData
  attr_reader :data, :types

  def initialize(data)
    @data = data

    @types = data.shift.split(";")

    raise "There are no data for print" if data.empty?
  end

  def values_by_columns
    data.each_with_object([]) do |row, columns|
      cells = row.split(";")

      cells.each_with_index do |cell, index|
        columns[index] ||= []
        columns[index] << cell
      end
    end
  end
end
