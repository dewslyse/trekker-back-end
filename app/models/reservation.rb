class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :fee, presence: true,
                  numericality: { greater_than_or_equal_to: 0, message: 'Fee must be greater than or equal to 0' }
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today,
                                       message: 'start_date must be greater than or equal to today'
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date,
                                     message: 'end_date must be greater than or equal to start date'
end
