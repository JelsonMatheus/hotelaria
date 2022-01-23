# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'


TAM = 30

quarto_tipos = QuartoTipo.create([{nome: "Comum"}, {nome: "Vipe"}, {nome: "Suite"}])

clientes = []
for i in 1..TAM do
    clientes.push(Cliente.create(
        nome: "Teste #{i}",
        cpf: "000.000-00",
        telefone: "(88) 9999991",
        email: "exemple@gmail.com"
    ))
end

hoteis = []
for i in 1..TAM do
    hoteis.push(Hotel.create(
        nome: "Transilvania #{i}",
        telefone: "(88) 9999991",
        pais: "Brasil",
        cidade: "Teresina",
        estado: "Piauí",
        rua: "Rua #{i}"
    ))
end

quartos = []
for i in 1..TAM do
    quartos.push(Quarto.create(
        hotel: hoteis.sample(1).first,
        quarto_tipo: quarto_tipos.sample(1).first,
        numero: i,
        descricao: "Teste",
        capacidade: i,
        preco: rand(120.5..200),
        reservado: [true, false].sample(1).first
    ))
end

reservas = []
for i in 1..TAM do
    reservas.push(Reserva.create(
        quarto: quartos.sample(1).first,
        cliente: clientes.sample(1).first,
        data_reserva: DateTime.now(),
        check_in: DateTime.now(),
        check_out: DateTime.now(),
        preco_total: rand(120.5..200)
    ))
end
