class Admin::ReservaController < ApplicationController
    layout "admin"

    def index
        @modulo = "Lista de Reservas"
        @reservas = Reserva.all.page params[:page]
    end
    def new
        @reserva = Reserva.new
    end

    def create
        @reserva = Reserva.new(reserva_params)
        if @reserva.save
          @quarto = Quarto.find(reserva_params[:quarto_id])
          @quarto.reservado = true
          @quarto.save
          redirect_to admin_reserva_index_path
        else
          render :new
        end
    end 

    def edit
        @reserva = Reserva.find(params[:id])
    end
  
    def update
      @reserva = Reserva.find(params[:id])
  
      if @reserva.update(reserva_params)
        redirect_to admin_reserva_index_path
      else
        render :edit
      end
    end

    private
        def reserva_params
           params.require(:reserva).permit(:quarto_id, :data_reserva, :check_in, :check_out, :preco_total, :cliente_id)
        end
end
