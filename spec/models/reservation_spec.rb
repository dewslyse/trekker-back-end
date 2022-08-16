# == Schema Information
#
# Table name: reservations
#
#  id             :bigint           not null, primary key
#  end_date       :date
#  fee            :decimal(, )
#  start_date     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_reservations_on_destination_id  (destination_id)
#  index_reservations_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (destination_id => destinations.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
