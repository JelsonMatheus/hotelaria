class Admin::HotelController < ApplicationController

    layout "admin"
    
    def index
        @modulo = "Lista de Hotéis"
        @hoteis = Hotel.all
    end

end
