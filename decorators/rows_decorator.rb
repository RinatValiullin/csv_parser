# frozen_string_literal: true

Dir[
  "./decorators/base_decorator.rb",
  "./decorators/int_decorator.rb",
  "./decorators/money_decorator.rb",
  "./decorators/string_decorator.rb",
].sort.each { |file| require file }

class RowsDecorator < BaseDecorator
  TYPES = {
    "int" => IntDecorator,
    "string" => StringDecorator,
    "money" => MoneyDecorator
  }.freeze

  def decorate(data_types)
    @values.each_with_index do |value, index|
      type = data_types[index]

      @values[index] = TYPES[type].new(value).decorate
    end
  end
end
