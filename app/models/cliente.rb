class Cliente < ApplicationRecord
    has_many :reservas
    has_many :quartos, through: :reservas
end
