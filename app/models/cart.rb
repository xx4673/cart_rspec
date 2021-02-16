class Cart
  attr_reader :items
  def initialize(items = [])
    @items = items
  end

  def add_item(product_id)
    # @items << product_id  
    sort_item= items.find{ |item| item.product_id == product_id }
    if sort_item
      sort_item.increment
    else
      @items << CartItem.new(product_id)
    end

  end  
  
  def empty?
    @items.empty?
  end

  def total_price
    items.reduce(0){|sum, item| sum + item.price }
  end

  def serialize
    all_items = items.map{|item| { "product_id" => item.product_id, "quantity" => item.quantity } }
    { "items" => all_items }
  end

  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map { |hash_item| CartItem.new(hash_item["product_id"], hash_item["quantity"]) }
    end
    
  end
  

end