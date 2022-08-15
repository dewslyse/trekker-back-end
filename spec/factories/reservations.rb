# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  end_date   :date
#  fee        :decimal(, )
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
# FactoryBot.define do
#   factory :reservation do
#   end
# end