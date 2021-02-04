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
    
  end

  describe "進階功能" do
    
  end
end
