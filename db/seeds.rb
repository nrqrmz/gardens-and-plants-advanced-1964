# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Garden.create(
#   name: 'El jardin de Jorge',
#   banner_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg'
# )

# puts 'Jardin generado'

Chore.destroy_all if Rails.env.development?

names = %w[Water Mist Clean Feed Repot Rotate]

names.each do |name|
  Chore.create!(name: name)
end

