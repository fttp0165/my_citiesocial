require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart){Cart.new}
  describe "基本功能" do
    # befor(:each) do
    #   @cart=Cart.new
    # end
    # let(:cart){Cart.new}
    it "可以把商品丟到購物車裡，購物車會有東西" do
      # cart=Cart.new
      cart.add_sku(2)
      cart.add_sku(2)
      # expect(cart.empty?).to be false
      expect(cart).not_to be_empty
    end

    it "增加相同產品項目不增，數量增加" do
      # cart=Cart.new
      3.times {cart.add_sku(1)}
      2.times {cart.add_sku(2)}
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end

    it "商品放到購物車，可以再拿出來" do
      # cart=Cart.new
      # v1=Vendor.create(title:"v1")
      # p1=Product.create(name:'kk',list_price:10,sell_price:5,vendor:v1)
      p1=FactoryBot.create(:product,:with_skus)
      cart.add_sku(p1.skus.first.id)
      expect(cart.items.first.product).to be_a Product
    end

    it "整台車的總金額" do
      # cart=Cart.new
      p1=FactoryBot.create(:product,:with_skus,sell_price:5)
      p2=FactoryBot.create(:product,:with_skus,sell_price:10)
      3.times {cart.add_sku(p1.skus.first.id)}
      2.times {cart.add_sku(p2.skus.first.id)}
      expect(cart.total_price).to eq 35
    end
    
  end

  describe "進階功能" do
    it "產生成hash" do
      # cart=Cart.new
      p1=FactoryBot.create(:product,:with_skus,sell_price:5)
      p2=FactoryBot.create(:product,:with_skus,sell_price:10)

      3.times {cart.add_sku(p1.id)}
      2.times {cart.add_sku(p2.id)}
      expect(cart.serialize).to eq cart_hash
    end

    it "可以存放入session(hash) 還原成購物車" do
      cart=Cart.from_hash(cart_hash)
      expect(cart.items.first.quantity).to be 3
    end
    private 
    def cart_hash
      {
        "items"=>[
          {"sku_id"=>1,"quantity"=>3},
          {"sku_id"=>2,"quantity"=>2}
        ]
      }
    end
  end
end
