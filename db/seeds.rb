# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# unless Rails.env.development?
#   puts "[db/seeds.rb] Seed data is being loaded in development mode. not #{Rails.env.production?}"
#   exit 0
# end

# require 'factory_bot'

# User.destroy_all
# Destination.destroy_all
# Reservation.destroy_all
# puts "[db/seeds.rb] Seeding data..."
# FactoryBot.create_list(:user, 5)
# FactoryBot.create_list(:destination, 5)
# FactoryBot.create_list(:reservation, 5)
# puts "[db/seeds.rb] Seeding data...done"

users = User.create!([
  { full_name: 'Selase One', username: 'selase', email: 'selase@trekker.com', password: 'password', password_confirmation: 'password' },
  { full_name: 'Teshome Two', username: 'teshome', email: 'teshome@trekker.com', password: 'password', password_confirmation: 'password' },
  { full_name: 'Catherine Three', username: 'cathy', email: 'cathy@trekker.com', password: 'password', password_confirmation: 'password' },
  { full_name: 'Amina Four', username: 'aminat', email: 'aminat@trekker.com', password: 'password', password_confirmation: 'password' }
])

destinations = Destination.create!([
  { name: 'Serengeti in five days', city_name: 'Serengeti', description: 'The Serengeti National Park is the largest national park in the world. The park is home to the largest intact ecosystem in the world, the Serengeti ecosystem.', image_url: 'https://cdn.pixabay.com/photo/2015/10/31/18/30/africa-1016064_960_720.jpg', user_id: 1 },
  { name: 'Climb Kilimanjaro', city_name: 'Kilimanjaro', description: 'Kilimanjaro is a mountain range in the Kaskazini National Park in the Tanzania. It is the highest mountain in the Kaskazini National Park.', image_url: 'https://cdn.pixabay.com/photo/2019/03/18/08/59/africa-4062680_960_720.jpg', user_id: 1 },
  { name: 'Elephant Trekking, Ghana', city_name: 'Tamale', description: 'The Elephants are the largest and most diverse group of African animals in the world. They are found in the forests of the northern and central parts of the country.', image_url: 'https://cdn.pixabay.com/photo/2019/05/17/07/38/sunset-4209085_960_720.jpg', user_id: 1 },
  { name: 'Kayaking Norway', city_name: 'Oslo', description: 'Kayaking is a type of water sport that involves rowing across a river, lake or other body of water at a fast speed. It is a type of water sport.', image_url: 'https://cdn.pixabay.com/photo/2020/01/21/09/43/scandinavia-4782484_960_720.jpg', user_id: 1 },
  { name: 'Explore Iceland', city_name: 'Reykjavik', description: 'Iceland is a Nordic country in the North Atlantic Ocean. It is the third-largest country in the European Union and the most populous in the world.', image_url: 'https://cdn.pixabay.com/photo/2020/07/22/08/39/waterfall-5428467_960_720.jpg', user_id: 1 }
])

Reservation.create!([
  { start_date: Date.today, end_date: Date.today + 5, fee: 1000, destination_id: 1, user_id: 1 },
  { start_date: Date.today, end_date: Date.today + 5, fee: 200, destination_id: 2, user_id: 1 },
  { start_date: Date.today, end_date: Date.today + 3, fee: 3000, destination_id: 2, user_id: 2 },
  { start_date: Date.today, end_date: Date.today + 5, fee: 400, destination_id: 4, user_id: 3 },
  { start_date: Date.today, end_date: Date.today + 5, fee: 320, destination_id: 5, user_id: 4 },
  { start_date: Date.today, end_date: Date.today + 5, fee: 320, destination_id: 4, user_id: 4 }
])
  
 