class Purchased < ApplicationRecord
  belongs_to :purchase_management
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address

  with_options presence: true do
    validates :postal_code,      format: { with: /^\d{3}[-]\d{4}$/ }
    validates :municipalities,   format: { with: /^[ぁ-んァ-ン一-龥]/ }
    validates :shipping_address, format: { with: /^[ぁ-んァ-ン一-龥]/, with:/^[0-9]+$/ }
    validates :phone_number,     format: { with: /^\d{10}$|^\d{11}$/ }
  end
  validates :building,           format: { with: /^[ぁ-んァ-ン一-龥]/, with:/^[0-9]+$/ }
  validates :address_id,         numericality: { other_than: 0 }
end
