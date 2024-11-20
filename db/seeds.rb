# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "#Create User"
user = User.create(email: "diego@example.com", password: "diego@example.com")

puts "#Create Address"
Address.create(state: "Rio Grande do Norte", city: "Natal", neighborhood: "Centro", street: "Rua da Paz", number: "01", zipcode: "59144000", reference_point: "Praça da Paz", user: user)

puts "#Create Category"
category = Category.create(title: "Casamento")

puts "#Create Subcategory"
Subcategory.create(title: "Bolo", category: category)

puts "#Create Announcement"
Announcement.create(title: "Bolo de Casamento", description: "Melhor Bolo", value: 2000.00, category: category, user: user)
