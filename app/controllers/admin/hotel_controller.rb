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

    def new
        @hotel = Hotel.new
    end

    def create
        @hotel = Hotel.new(hotel_params)
        if @hotel.save
          redirect_to admin_hotel_index_path
        else
          render :new
        end
    end 

    def edit
        @hotel = Hotel.find(params[:id])
    end
  
    def update
      @hotel = Hotel.find(params[:id])
  
      if @hotel.update(hotel_params)
        redirect_to admin_hotel_index_path
      else
        render :edit
      end
    end

    private
        def hotel_params
           params.require(:hotel).permit(:nome, :telefone, :pais, :cidade, :estado, :rua)
        end
end
