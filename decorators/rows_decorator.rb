# frozen_string_literal: true

Dir[
  "./decorators/int_decorator.rb",
  "./decorators/money_decorator.rb",
  "./decorators/string_decorator.rb",
].sort.each { |file| require file }

class RowsDecorator
  attr_reader :columns

  TYPES = {
    "int" => IntDecorator,
    "string" => StringDecorator,
    "money" => MoneyDecorator
  }.freeze

  def initialize(columns)
    @columns = columns
  end

  def decorate(types)
    validate_types(types)
    p(columns)
    columns.each_with_index.map do |column, index|
      type = types[index]

      TYPES[type].new(column).decorate
    end
  end

  private

  def validate_types(types)
    types.each do |type|
      raise "Invalid data type in file" unless TYPES.keys.include?(type)
    end
  end
end
