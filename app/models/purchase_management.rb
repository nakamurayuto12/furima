class PurchaseManagement < ApplicationRecord
  has_one :purchased
  belongs_to :user
  belongs_to :item
end
