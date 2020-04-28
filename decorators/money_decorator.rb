require "./decorators/base_decorator.rb"

class MoneyDecorator < BaseDecorator
  def decorate
    @values.map do |value|
      splitted_value = value.split(".")

      [splitted_value.first.chars.to_a.reverse.each_slice(3).map(&:join).join(" ").reverse + "," + splitted_value.last.chars.last(2).join]
    end
  end
end
