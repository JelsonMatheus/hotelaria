class Reserva < ApplicationRecord
    belongs_to :cliente
    belongs_to :quarto 

    scope :filter_by_cliente, -> (cliente_id) { where cliente_id: cliente_id }
end
