# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CADASTRANDO ESTADOS

ceara = State.create!(name: "Ceará")
pernambuco = State.create!(name: "Pernambuco")
rio_grande_do_norte = State.create!(name: "Rio Grande do Norte")
bahia = State.create!(name: "Bahia")
sao_paulo = State.create!(name: "São Paulo")
rio_de_janeiro = State.create!(name: "Rio de Janeiro")
rio_grande_do_sul = State.create!(name: "Rio Grande do Sul")
minas_gerais = State.create!(name: "Minas Gerais")


# CADASTRANDO CIDADES

cities = [	
	{name: "Fortaleza", state: ceara},
	{name: "Caucaia", state: ceara},
	{name: "Maracanaú", state: ceara},
	{name: "Recife", state: pernambuco},
	{name: "Olinda", state: pernambuco},
	{name: "Natal", state: rio_grande_do_norte},
	{name: "São Paulo", state: sao_paulo},
	{name: "Guarulhos", state: sao_paulo},
	{name: "Santos", state: sao_paulo},
	{name: "Rio de Janeiro", state: rio_de_janeiro},
	{name: "Niterói", state: rio_de_janeiro},
	{name: "Salvador", state: bahia},
	{name: "Vitória da Conquista", state: bahia},
	{name: "Porto Alegre", state: rio_grande_do_sul},
	{name: "Santa Maria", state: rio_grande_do_sul},
	{name: "Belo Horizonte", state: minas_gerais},
	{name: "Uberlândia", state: minas_gerais}
]

City.create!(cities)