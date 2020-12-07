class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipment_source
  belongs_to :day_to_ship

  validates :category_id,          numericality: { other_than: 1 }
  validates :status_id,            numericality: { other_than: 1 }
  validates :shipping_charge_id,   numericality: { other_than: 1 }
  validates :shipment_source_id,   numericality: { other_than: 0 }
  validates :day_to_ship_id,       numericality: { other_than: 1 }
end
