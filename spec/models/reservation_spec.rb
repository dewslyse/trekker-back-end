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
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:reservation)).to be_valid
    end

    context 'when the start_date is valid' do
      it 'is invalid when the start_date is null' do
        expect(build(:reservation, start_date: nil)).to_not be_valid
      end

      it 'is invalid when the start_date is empty' do
        expect(build(:reservation, start_date: '')).to_not be_valid
      end

      it 'is invalid when the start_date is less than today' do
        expect(build(:reservation, start_date: Date.today - 1)).to_not be_valid
      end
    end
    context 'when the end_date is valid' do
      it 'is invalid when the end_date is null' do
        expect(build(:reservation, end_date: nil)).to_not be_valid
      end

      it 'is invalid when the end_date is empty' do
        expect(build(:reservation, end_date: '')).to_not be_valid
      end

      it 'is invalid when the end_date is less than start_date' do
        expect(build(:reservation, end_date: Date.today - 1)).to_not be_valid
      end
    end

    context 'when the fee is valid' do
      it 'is invalid when the fee is null' do
        expect(build(:reservation, fee: nil)).to_not be_valid
      end

      it 'is invalid when the fee is empty' do
        expect(build(:reservation, fee: '')).to_not be_valid
      end

      it 'is invalid when the fee is less than 0' do
        expect(build(:reservation, fee: -1)).to_not be_valid
      end
    end
  end
end
