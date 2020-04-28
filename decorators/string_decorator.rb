# frozen_string_literal: true

require "./decorators/base_decorator.rb"

class StringDecorator < BaseDecorator
  def decorate
    @values.map do |value|
      cells = value.split(" ")
      max_length_cell = cells.max_by(&:length).length
      cells.map do |cell|
        cell_lenght = cell.length
        difference_between_cells_length = max_length_cell - cell_lenght
        cell.ljust(cell.length + difference_between_cells_length, " ")
      end
    end
  end
end
