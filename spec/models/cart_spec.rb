require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "six basic cart features" do
    it "add product into the cart and there the product is" do    
      cart = Cart.new  
      cart.add_item(1)

      expect(cart.empty?).to be false
    end

    it "add the same product multi times and the cartitem number won't increase but the quantity increase" do
      cart = Cart.new     
      2.times{ cart.add_item(1) }
      6.times{ cart.add_item(2) }
      7.times{ cart.add_item(3) }

      expect(cart.items.length).to be 3
      expect(cart.items.first.quantity).to be 2
      expect(cart.items.second.quantity).to be 6
      expect(cart.items.third.quantity).to be 7
    end

    it "the product can be added in and deleted from the cart" do    
      cart = Cart.new  
      p1 = Product.create(title: "清心綠茶")
      p2 =Product.create(title: "黑糖鮮奶")
      3.times{ cart.add_item(p1.id) }
      4.times{ cart.add_item(p2.id) }

      expect(cart.items.first.product_id).to be p1.id
      expect(cart.items.second.product_id).to be p2.id
      expect(cart.items.first.product).to be_a Product
    end

    it "able to count the total price for the whole cart" do      
    end

    it "discount for different festivals(ex. 10% off on christmas or $100 off for every $1000 purchase)" do      
    end
    
  end

  describe "two advance cart features" do
    it "to convert cart info into Hash and store in the Session" do
      
    end

    it "return the Session(format: Hash) to cart info " do
      
    end
    
  end
  
  
end
