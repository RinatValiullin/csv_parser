# frozen_string_literal: true

require "./decorators/string_decorator.rb"

describe StringDecorator do
  it "#decorate" do
    data = ["a bbb aa"]

    expect(StringDecorator.new(data).decorate).to eql [["a  ", "bbb", "aa "]]
  end
end
