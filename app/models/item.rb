class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :day_to_ship

  validates :image,                presence: true
  validates :title,                presence: true
  validates :title,                length: { maximum: 40 }
  validates :text,                 presence: true
  validates :text,                 length: { maximum: 1000 }
  validates :category_id,          numericality: { other_than: 1 }
  validates :status_id,            numericality: { other_than: 1 }
  validates :shipping_charges_id,  numericality: { other_than: 1 }
  validates :shipment_source_id,   numericality: { other_than: 0 }
  validates :day_to_ship_id,       numericality: { other_than: 1 }
  validates :price,                presence: true
  validates :price,                format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
  validates :price,                numericality: { greater_than_or_equal_to: 300 }
  validates :price,                numericality: { less_than_or_equal_to: 9999999 } 
end
