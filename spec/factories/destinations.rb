FactoryBot.define do
  factory :destination do
    city_name { Faker::Address.city }
    description { Faker::Lorem.paragraph }
    image_url { Faker::LoremPixel.image }
    name { "pre#{Faker::Lorem.word}" }
    fee { %w[1000 200 3000 400 320].sample }
    user { User.first || association(:user) }
  end
end
