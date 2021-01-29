require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "驗證廠商名稱" do
    it "有填寫寫入資料庫" do
      vendor =Vendor.new(title: 'Hello')
      expect(vendor).to be_valid
    end
    it "沒有填寫無法寫入" do
      vendor =Vendor.new
      expect(vendor).not_to be_valid
    end
  end
end
