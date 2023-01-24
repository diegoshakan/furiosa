# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Diego", last_name: "Araujo", email: "diego@example.com", password: "changeme",
            nickname: "Dieguinho", gender: "male", phone: "84999991111")

category_happy_party = Category.create(name: "Festa de Aniversário")
Subcategory.create(name: "Criança", category: category_happy_party)
Subcategory.create(name: "Adulto", category: category_happy_party)

category_wedding_party = Category.create(name: "Festa de Casamento")
Subcategory.create(name: "Bolos", category: category_wedding_party)
Subcategory.create(name: "Ornamentação", category: category_wedding_party)
