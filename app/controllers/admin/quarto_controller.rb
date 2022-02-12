class Admin::QuartoController < ApplicationController

    def new
        @quarto = Reserva.new
    end

    def create
        @quarto = Reserva.new(reserva_params)
        if @quarto.save
          redirect_to admin_quarto_index_path
        else
          render :new
        end
    end

    private
        def quarto_params
           params.require(:reserva).permit(:quarto, :data_reserva, :check_in, :check_out, :preco_total, :cliente)
        end
end
