# frozen_string_literal: true

require "./decorators/base_decorator.rb"

class MoneyDecorator < BaseDecorator
  def decorate
    @values.map do |value|
      integer_part, fractional_part = value.split(".")

      [integer_part.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1 ').reverse + "," + fractional_part.chars.last(2).join]
    end
  end
end
