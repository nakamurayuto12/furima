class Purchased < ApplicationRecord
  belongs_to :purchase_management
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :address

end
