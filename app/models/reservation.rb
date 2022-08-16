class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :start_date, presence: true, comparison: { greater_than_or_equal_to: Date.today }
  validates :end_date, presence: true, comparison: { greater_than_or_equal_to: :start_date }
  validates :fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
