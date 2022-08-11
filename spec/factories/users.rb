# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
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
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
FactoryBot.define do
  factory :user do
    username { SecureRandom.hex(3) }
    first_name { %w[Adam Sam Mike].sample }
    last_name { ["Soesanto", "Yamashita", "de Flaire"].sample }
    phone_number { %w[+2511155252222 +1253655256336 +3265652365236].sample }
    email { "#{SecureRandom.hex(4)}@example.org}" }
  end
end
