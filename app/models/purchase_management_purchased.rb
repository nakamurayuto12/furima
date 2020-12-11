class PurchaseManagementPurchased
  include ActiveModel::Model
  attr_accessor :shipping_address, :postal_code, :phone_number, :municipalities, :address_id, :building, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,      format: { with: /\a\d{3}[-]\d{4}\z/ }
    validates :municipalities,   format: { with: /\a[ぁ-んァ-ン一-龥]/ }
    validates :shipping_address, format: { with: /\a[ぁ-んァ-ン一-龥]/, with:/\a[0-9]+\z/ }
    validates :phone_number,     format: { with: /\a\d{10}\z|\a\d{11}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :building,           format: { with: /\a[ぁ-んァ-ン一-龥]/, with:/\a[0-9]+\z/ }
  validates :address_id,         numericality: { other_than: 0 }

  def save
    purchase_management_id = Purchase_management.create(user_id: user_id, item_id: item_id)
    Purchased.create(shipping_address: shipping_address, postal_code: postal_code, phone_number: postal_code, municipalities: municipalities, address_id: address_id, building: building, purchase_management_id: purchase_management_id)
  end
end