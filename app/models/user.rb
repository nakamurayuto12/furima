class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  validates :surname_furigana, presence: true
  validates :name_furigana, presence: true
  validates :nickname, presence: true
end
