module CartsHelper
  def current_cart
    @cart ||= Cart.from_hash(session["cart_1123"])
  end
end
