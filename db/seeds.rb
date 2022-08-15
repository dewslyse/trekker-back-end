# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
unless Rails.env.development?
  puts "[db/seeds.rb] Seed data is being loaded in development mode. not #{Rails.env.production?}"
  exit 0
end

require 'factory_bot'

User.destroy_all
puts "[db/seeds.rb] Seeding data..."
FactoryBot.create_list(:user, 5)
puts "[db/seeds.rb] Seeding data...done"

Reservation.destroy_all
puts "[db/seeds.rb] Seeding data..."
FactoryBot.create(:reservation, 3)
puts "[db/seeds.rb] Seeding data...done"