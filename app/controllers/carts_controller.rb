class CartsController < ApplicationController

  def add
    product_id = params[:id]

    # cart = Cart.from_hash(session["cart_1123"])
    current_cart.add_item(product_id)
    session["cart_1123"] = current_cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end

  def show

  end

  def destroy
    session["cart_1123"] = nil
    redirect_to products_path, notice: "已清空購物車"
  end
end
