require_relative '../lib/checkout'

describe Checkout do
  before do
    @listing = {'A' => 50,
                'B' => 30,
                'C' => 20,
                'D' => 15}
    @discounts = {'A' => {batch: 3, price: 130},
                  'B' => {batch: 2, price: 45}}
  end

  it "should return 0 if empty input" do
    expect(price_for '').to be 0
  end

  it "should return the price for single items" do
    expect(price_for 'A').to be 50
    expect(price_for 'B').to be 30
    expect(price_for 'C').to be 20
    expect(price_for 'D').to be 15
  end

  it "should return the total price for multiple items with no discounts" do
    expect(price_for 'AB').to be 80
    expect(price_for 'CDBA').to be 115
    expect(price_for 'AA').to be 100
  end

  it "should discount 3x A items" do
    expect(price_for 'AAA').to be 130
  end

  it "should discount 2x B items" do
    expect(price_for 'BBB').to be 75
  end

  it "should discount multiple items at once" do
    expect(price_for 'ABABAB').to be 205
  end

  def price_for(products)
    co = Checkout.new(@listing, @discounts)
    products.each_char { |p| co.scan p}
    co.total
  end
end
