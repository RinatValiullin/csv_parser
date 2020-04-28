require "./decorators/base_decorator.rb"

class IntDecorator < BaseDecorator
  def decorate
    max_lengh = @values.max_by(&:length).length

    @values.map { |value| [value.rjust(max_lengh)] }
  end
end
