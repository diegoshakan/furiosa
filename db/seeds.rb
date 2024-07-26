# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Criação Usuários
puts "Criação Usuários"
user1 = User.create(
  email: "user1@example.com",
  first_name: "User",
  last_name: "First",
  nickname: "user1",
  cpf_cnpj: "69169884013",
  cellphone: "84991000000",
  password: "changeme",
)

user2 = User.create(
  email: "user2@example.com",
  first_name: "User",
  last_name: "Second",
  nickname: "user2",
  cpf_cnpj: "94215719089",
  cellphone: "84991001111",
  password: "changeme",
)

# Criação Categorias
puts "Criação Categorias"
category1 = Category.create(name: "Batizado")
category2 = Category.create(name: "Casamento")

# Criação Subcategorias
puts "Criação Subcategorias"
Subcategory.create(name: "Lembrancinhas", category: category1)
Subcategory.create(name: "Bem Casado", category: category2)

# Criação Anúncios
puts "Criação Anúncios"
FactoryBot.create(:announcement, user: user1, category: category1)
FactoryBot.create(:announcement, user: user2, category: category2)
