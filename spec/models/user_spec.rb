# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    context 'when the username is valid' do
      it 'is invalid when the username is null' do
        expect(build(:user, username: nil)).to_not be_valid
      end

      it 'is invalid when the username is empty' do
        expect(build(:user, username: '')).to_not be_valid
      end

      it 'is invalid when the username is whitespace' do
        expect(build(:user, username: '     ')).to_not be_valid
      end

      it 'is invalid when the username is too long' do
        expect(build(:user, username: 'a' * 21)).to_not be_valid
      end

      it 'is invalid when the username is too short' do
        expect(build(:user, username: 'a')).to_not be_valid
      end

      it 'is invalid when the username is taken' do
        create(:user, username: 'teshe')
        user = build(:user, username: 'teshe')
        expect(user).to_not be_valid
      end
    end

    context 'when the email is valid' do
      it 'is invalid when the email is null' do
        expect(build(:user, email: nil)).to_not be_valid
      end

      it 'is invalid when the email is invalid format' do
        expect(build(:user, email: 'not an email')).to_not be_valid
      end

      it 'is invalid when the email is taken' do
        create(:user, email: 'email@teshe.com')
        user = build(:user, email: 'email@teshe.com')
        expect(user).to_not be_valid
      end
    end

    context 'when full_name is valid' do
      it 'is invalid when the full_name is null' do
        expect(build(:user, full_name: nil)).to_not be_valid
      end

      it 'is invalid when the full_name is empty' do
        expect(build(:user, full_name: '')).to_not be_valid
      end

      it 'is invalid when the full_name is too long' do
        expect(build(:user, full_name: 'a' * 21)).to_not be_valid
      end

      it 'is invalid when the full_name is too short' do
        expect(build(:user, full_name: 'a')).to_not be_valid
      end
    end

    context 'when the password is valid' do
      it 'is invalid when the password is null' do
        expect(build(:user, password: nil)).to_not be_valid
      end

      it 'is invalid when the password is empty' do
        expect(build(:user, password: '')).to_not be_valid
      end

      it 'is invalid when the password is too long' do
        expect(build(:user, password: 'a' * 21)).to_not be_valid
      end

      it 'is invalid when the password is too short' do
        expect(build(:user, password: 'a')).to_not be_valid
      end

      it 'is invalid when the password is not confirmed' do
        expect(build(:user, password_confirmation: 'not the same')).to_not be_valid
      end
    end

    context 'when the password confirmation is valid' do
      it 'is invalid when the password_confirmation is null' do
        expect(build(:user, password_confirmation: nil)).to_not be_valid
      end

      it 'is invalid when the password_confirmation is empty' do
        expect(build(:user, password_confirmation: '')).to_not be_valid
      end

      it 'is invalid when the password_confirmation is too long' do
        expect(build(:user, password_confirmation: 'a' * 21)).to_not be_valid
      end

      it 'is invalid when the password_confirmation is too short' do
        expect(build(:user, password_confirmation: 'a')).to_not be_valid
      end
    end
  end
end
