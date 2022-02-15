class Quarto < ApplicationRecord
    belongs_to :hotel
    belongs_to :quarto_tipo
    has_many :reservas, :dependent => :delete_all 
    has_many :clientes, through: :reservas, :dependent => :delete_all 

    scope :quarto_livre, -> { where(reservado: false) }
    scope :filter_by_hotel, -> (hotel_id) { where hotel_id: hotel_id }
end
