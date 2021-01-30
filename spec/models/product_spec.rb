require 'rails_helper'

RSpec.describe Product, type: :model do
  vendor =Vendor.new(title: 'Hello')
  context "驗證產品名稱" do
    it "有填寫寫入資料庫" do
      product =vendor.products.new(name: 'Hello',code:"@#$%^")
      expect(product).to be_valid
    end
    it "沒有填寫無法寫入" do
      product =Product.new
      expect(product).not_to be_valid
    end
  end
end
