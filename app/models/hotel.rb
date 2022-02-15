class Hotel < ApplicationRecord
    has_many :quartos, :dependent => :delete_all 
end
