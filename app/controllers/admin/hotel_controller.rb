class Admin::HotelController < ApplicationController

    layout "admin"
    
    def index
        @modulo = "Lista de Hotéis"
        @hoteis = Hotel.all.page params[:page]
    end

    def show
        @hotel = Hotel.find(params[:id])
    end
      
    def destroy
        Hotel.find_by(id: params[:id]).destroy
        redirect_to admin_hotel_index_path
    end
end
