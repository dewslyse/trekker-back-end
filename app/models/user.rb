class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :destinations, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, confirmation: true
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 20 }
end
