require 'rails_helper'

RSpec.describe Cart, type: :model do

  # before(:each) { @cart = Cart.new }
  # before(:all)

  let(:cart) { Cart.new }

  # def cart
  #   Cart.new
  # end

  describe "購物車基本功能" do
    it "可以新增商品到購物車裡，然後購物車裡就有東西了" do

      # cart = Cart.new
      # cart.add_item(1)
      # @cart.add_item(1)
      cart.add_item(1)
      expect(cart.empty?).to be false
      expect(cart).not_to be_empty

      # expect(user.adult?).to be true
      # expect(user).to be_adult

    end

    it "如果加了相同種類的商品，購買項目(CartItem)並不會增加，但數量會改變。" do

      cart = Cart.new
      #cart.add_item(1)
      3.times { cart.add_item 1 }
      5.times { cart.add_item 2 }
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.last.quantity).to be 5

    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      p1 = Product.create  # <== ActiveRecord, ORM

      cart = Cart.new
      cart.add_item(p1.id)

      # 拿出香蕉是香蕉  Product.new => p1  be_a => p1是不是一種商品
      expect(cart.items.first.product).to be_a Product
      expect(cart.items.first.product_id).to be p1.id

    end
    it "可以計算整個購物車的總消費金額" do

      p1 = Product.create(title: "Ruby", price: 10)
      p2 = Product.create(title: "PHP", price: 100)

      cart = Cart.new
      3.times { cart.add_item(p1.id) }
      5.times { cart.add_item(p2.id) }
      2.times { cart.add_item(p1.id) }

      expect(cart.total_price).to eq 550

    end
  end

  describe "購物車進階功能" do
    #* 因為購物車將以 Session 方式儲存，所以：
      #* 可以將購物車內容轉換成 Hash
      #* 也可以把 Hash 還原成購物車的內容
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
