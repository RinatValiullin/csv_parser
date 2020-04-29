# frozen_string_literal: true

require "./decorators/base_decorator.rb"

class MoneyDecorator < BaseDecorator
  def decorate
    @values.map do |value|
      rounded = value.to_f.ceil(2)
      [split_digest(format("%.2f", rounded))]
    end
  end

  private

  def split_digest(value)
    value.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1 ').reverse
  end
end
