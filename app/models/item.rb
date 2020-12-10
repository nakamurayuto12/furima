class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_management
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :shipment_source
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image
    validates :title,                length: { maximum: 40 }
    validates :text,                 length: { maximum: 1000 }
    validates :price,                format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :price,                numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :day_to_ship_id
  end
  validates :shipment_source_id,   numericality: { other_than: 0 }
end
