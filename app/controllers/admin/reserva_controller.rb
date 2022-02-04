class Admin::ReservaController < ApplicationController
    layout "admin"

    def index
        @modulo = "Lista de Reservas"
        @reservas = Reserva.all.page params[:page]
    end
end
