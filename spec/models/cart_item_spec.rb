require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "able to count the price for each cartitem" do
    p1 = Product.create(title: "珍珠鮮奶", price: 90)      
    p2 = Product.create(title: "黑糖奶蓋", price: 100)
    cart = Cart.new

    2.times{ cart.add_item(p1.id) }
    8.times{ cart.add_item(p2.id) }

    expect(cart.items.first.price).to be 180
    expect(cart.items.second.price).to be 800
  end
end
