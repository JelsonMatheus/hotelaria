class Quarto < ApplicationRecord
    belongs_to :hotel
    belongs_to :quarto_tipo
    has_many :reservas
    has_many :clientes through: :reservas
end
