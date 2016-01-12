class Checkout
  def initialize(listing, discounts)
    @listing, @discounts = listing, discounts
    @products = []
  end

  def scan(product)
    @products << product
  end

  def total
    @products.inject(0) { |sum, product| sum += price_for(product) } - discount
  end

  private

  def discount
    count_for_discounted_products.inject(0) do |discount_amount, (product, count)|
      discount_amount += discount_for_batch_of(product) * times_to_apply_discount(product, count)
    end
  end

  def discount_for_batch_of(product)
    @discounts[product][:batch] * price_for(product) - @discounts[product][:price]
  end

  def times_to_apply_discount(product, count)
    (count / @discounts[product][:batch]).floor
  end

  def count_for_discounted_products
    @discounts.map { |k, v|
      [k, @products.select { |p| p == k }.count]
    }.to_h
  end

  def price_for(product)
    @listing[product] || 0
  end
end