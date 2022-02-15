class Hotel < ApplicationRecord
    has_many :quartos, :dependent => :delete_all

    scope :filter_by_starts_with, -> (nome) { where("nome like ?", "#{nome}%")}
end
