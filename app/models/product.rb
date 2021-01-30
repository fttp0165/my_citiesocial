class Product < ApplicationRecord
  acts_as_paranoid
  belongs_to :vendor
  validates :name, presence: true
  validates :code, presence: true
  
end
