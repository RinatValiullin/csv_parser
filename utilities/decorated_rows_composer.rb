# frozen_string_literal: true

class DecoratedRowsComposer
  attr_accessor :rows, :composed_rows, :values_count

  def initialize(rows, values_count)
    @rows = rows
    @composed_rows = []
    @values_count = values_count
  end

  def compose
    values_count.times do |index|
      rows.each do |values|
        composed_rows[index] ||= []
        composed_rows[index] << values[index]
      end
    end
  end
end
