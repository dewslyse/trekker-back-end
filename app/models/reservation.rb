# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  fee        :decimal(5, 2)
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  # belongs_to :destination

  validates :fee, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
