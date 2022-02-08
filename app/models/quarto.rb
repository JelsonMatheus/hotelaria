class Quarto < ApplicationRecord
    belongs_to :hotel
    belongs_to :quarto_tipo
    has_many :reservas, :dependent => :delete_all 
    has_many :clientes, through: :reservas, :dependent => :delete_all 
end
