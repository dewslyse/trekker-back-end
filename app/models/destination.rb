class Destination < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :city_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :image_url, presence: true, length: { minimum: 3, maximum: 50 }
end
