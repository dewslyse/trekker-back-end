FactoryBot.define do
  factory :reservation do
    start_date { Date.today }
    end_date { Date.today + 1 }
    destination { Destination.all.sample || association(:destination) }
    user { User.all.sample || association(:user) }
  end
end
