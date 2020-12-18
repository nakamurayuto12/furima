class PurchaseManagementPurchased
  include ActiveModel::Model
  attr_accessor :token, :shipping_address, :postal_code, :phone_number, :municipalities, :address_id, :building, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipalities
    validates :shipping_address
    validates :phone_number,     format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :address_id,         numericality: { other_than: 0 }

  def save
    purchase_management_id = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Purchased.create(shipping_address: shipping_address, postal_code: postal_code, phone_number: postal_code, municipalities: municipalities, address_id: address_id, building: building, purchase_management_id: purchase_management_id)
  end
end