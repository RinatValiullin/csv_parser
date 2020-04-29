# frozen_string_literal: true

require "./decorators/money_decorator.rb"

describe MoneyDecorator do
  it "#decorate" do
    data = %w(1.00 100.001 1000000.0044)

    expect(MoneyDecorator.new(data).decorate).to eql [["        1.00"], ["      100.01"], ["1 000 000.01"]]
  end
end
