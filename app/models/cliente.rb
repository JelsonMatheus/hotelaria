class Cliente < ApplicationRecord
    has_many :reservas
    has_many :quartos, through: :reservas, :dependent => :delete_all

    scope :filter_by_starts_with, -> (nome) { where("nome like ?", "#{nome}%")}
end
