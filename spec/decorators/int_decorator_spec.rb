# frozen_string_literal: true

require "./decorators/int_decorator.rb"

describe IntDecorator do
  it "#decorate" do
    data = %w(1 100 10)

    expect(IntDecorator.new(data).decorate).to eql [["  1"], ["100"], [" 10"]]
  end
end
