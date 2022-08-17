FactoryBot.define do
  factory :reservation do
    start_date { Date.today }
    end_date { Date.today + 1 }
    fee { [1000, 200, 3000, 400, 320].sample }
    destination { Destination.all.sample || association(:destination) }
    user { User.all.sample || association(:user) }
  end
end
