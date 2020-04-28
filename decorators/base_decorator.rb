# frozen_string_literal: true

class BaseDecorator
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def decorate; end
end
