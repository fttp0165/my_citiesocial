require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到購物車裡，購物車會有東西" do
      cart=Cart.new
      cart.add_item(2)
      cart.add_item(2)
      expect(cart.empty?).to be false
    end

    it "增加相同產品項目不增，數量增加" do
      cart=Cart.new
      3.times {cart.add_item(1)}
      2.times {cart.add_item(2)}
      expect(cart.item.count).to be 2
      expect(cart.item.first.quantity).to be 3
    end

    it "商品放到購物車，可以再拿出來" do
      cart=Cart.new
      # v1=Vendor.create(title:"v1")
      # p1=Product.create(name:'kk',list_price:10,sell_price:5,vendor:v1)
      p1=FactoryBot.create(:product)
      cart.add_item(p1.id)
      expect(cart.item.first.product).to be_a Product
    end
    
  end

  describe "進階功能" do
    
  end
end
