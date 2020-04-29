# frozen_string_literal: true

require "./decorators/base_decorator.rb"

class StringDecorator < BaseDecorator
  def decorate
    values.map do |value|
      cells = value.split(" ")

      cells.map { |cell| cell.ljust(max_length) }
    end
  end

  private

  def max_length
    @max_length ||= values.map { |value| value.split(" ") }
                          .flatten
                          .max_by(&:length)
                          .length
  end
end
