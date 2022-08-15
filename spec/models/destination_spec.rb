# == Schema Information
#
# Table name: destinations
#
#  id          :bigint           not null, primary key
#  city_name   :string
#  description :text
#  image_url   :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_destinations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Destination, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
