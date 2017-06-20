# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando os ESTADOS..."

states = [
	"Ceará",
	"Pernambuco",
	"Rio Grande do Norte",
	"São Paulo",
	"Rio de Janeiro",
	"Bahia",
	"Rio Grande do Sul",
	"Minas Gerais"
]

states.each do |s|
	State.create!(name: s)
end

puts "ESTADOS cadastrados com sucesso!"

####################################################################################

puts "Cadastrando as CIDADES"

City.create!(name: "Fortaleza", state_id: State.find_by(name: "Ceará").id)
City.create!(name: "Caucaia", state_id: State.find_by(name: "Ceará").id)
City.create!(name: "Maracanaú", state_id: State.find_by(name: "Ceará").id)
City.create!(name: "Recife", state_id: State.find_by(name: "Pernambuco").id)
City.create!(name: "Olinda", state_id: State.find_by(name: "Pernambuco").id)
City.create!(name: "Natal", state_id: State.find_by(name: "Rio Grande do Norte").id)
City.create!(name: "São Paulo", state_id: State.find_by(name: "São Paulo").id)
City.create!(name: "Guarulhos", state_id: State.find_by(name: "São Paulo").id)
City.create!(name: "Santos", state_id: State.find_by(name: "São Paulo").id)
City.create!(name: "Rio de Janeiro", state_id: State.find_by(name: "Rio de Janeiro").id)
City.create!(name: "Niterói", state_id: State.find_by(name: "Rio de Janeiro").id)
City.create!(name: "Salvador", state_id: State.find_by(name: "Bahia").id)
City.create!(name: "Vitória da Conquista", state_id: State.find_by(name: "Bahia").id)
City.create!(name: "Porto Alegre", state_id: State.find_by(name: "Rio Grande do Sul").id)
City.create!(name: "Santa Maria", state_id: State.find_by(name: "Rio Grande do Sul").id)
City.create!(name: "Belo Horizonte", state_id: State.find_by(name: "Minas Gerais").id)
City.create!(name: "Uberlândia", state_id: State.find_by(name: "Minas Gerais").id)

puts "CIDADES cadastradas com sucesso!"