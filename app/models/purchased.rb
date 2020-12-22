class Purchased < ApplicationRecord
  belongs_to :purchase_management
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address

end
