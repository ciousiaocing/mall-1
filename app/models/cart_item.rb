class CartItem
  attr_reader :product_id, :quantity

  def initialize(product_id, quantity = 1) #@
    @product_id = product_id
    @quantity = quantity
  end

  def increment(n = 1) #@
    @quantity += n
  end

  def product
    Product.find(@product_id)
  end

  def total_price
    product.price * @quantity
    # (product.price * @quantity).to_i
    # @product_id.price * quantity
  end

end

# x = CartItem.new(1, 2)
# x = CartItem.new(1)

#attr_reader
# x.quantity()
# x.product_id()
