class Vendor < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true
  has_many :products

  scope :available,->{where(online:true)}
  # def self.available
  #   Vendor.where(online: true)
  # end
end
