require "./decorators/base_decorator.rb"

class StringDecorator < BaseDecorator
  def decorate
    @values.map { |value| value.split(" ") }
  end
end
