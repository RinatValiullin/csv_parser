Dir[
  "./decorators/base_decorator.rb",
  "./decorators/int_decorator.rb",
  "./decorators/money_decorator.rb",
  "./decorators/string_decorator.rb",
].each {|file| require file }

class RowDecorator < BaseDecorator
  TYPES = {
    "int" => IntDecorator,
    "string" => StringDecorator,
    "money" => MoneyDecorator
  }

  def decorate(data_types)
    @values.each_with_index do |value, index|
      type = data_types[index]
      @values[index] = TYPES[type].new(value).decorate
    end
  end
end
