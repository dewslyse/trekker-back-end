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
#  user_id     :bigint
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
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:destination)).to be_valid
    end

    context 'when the name is valid' do
      it 'is invalid when the name is null' do
        expect(build(:destination, name: nil)).to_not be_valid
      end

      it 'is invalid when the name is empty' do
        expect(build(:destination, name: '')).to_not be_valid
      end

      it 'is invalid when the name is less than 3 characters' do
        expect(build(:destination, name: 'ab')).to_not be_valid
      end

      it 'is invalid when the name is more than 30 characters' do
        expect(build(:destination, name: 'a' * 31)).to_not be_valid
      end
    end
  end
end
