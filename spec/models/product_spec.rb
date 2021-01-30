require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @vendor =Vendor.new(title: 'Hello')
  end
 
  context "驗證產品名稱" do
    it "有填寫寫入資料庫" do
      product =@vendor.products.new(name: 'Hello',code:"@#$%^")
      expect(product).to be_valid
    end
    it "沒有填寫無法寫入" do
      product =Product.new
      expect(product).not_to be_valid
    end
    it "有VENDOR但CODE重複 無法寫入" do
      product =@vendor.products.new(name: 'Hello',code:"5555")
      product.save
      product_code =@vendor.products.new(name: 'Hello2',code:"5555")
      expect { product_code.save!(validate: false) }.to raise_error
    end
  end
end
