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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many: locations, dependent: :destroy
  # has_many: reservations, dependent: :destroy
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, length: { minimum: 3, maximum: 20 }
  PHONE_REGEX_COUNTRY = /\+(?:[0-9] ?){6,14}[0-9]/
  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/
  validates :phone_number, length: { minimum: 6, maximum: 14 },
                           format: { with: PHONE_REGEX_COUNTRY, message: 'Please enter a valid number' }
  validates :email, format: { with: EMAIL_REGEX, message: 'Please enter a valid email address' }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, confirmation: true
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 20 }
end
