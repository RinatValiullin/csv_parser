# frozen_string_literal: true

require "./decorators/base_decorator.rb"

class MoneyDecorator < BaseDecorator
  def decorate
    formatted_values = values.map do |value|
      rounded = value.to_f.ceil(2)
      split_digest(format("%.2f", rounded))
    end

    max_length = max_value_length(formatted_values)
    formatted_values.map { |value| [value.rjust(max_length)] }
  end

  private

  def split_digest(value)
    value.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1 ').reverse
  end

  def max_value_length(formatted_values)
    formatted_values.max_by(&:length).length
  end
end
