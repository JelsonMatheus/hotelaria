class Admin::ReservaController < ApplicationController
    layout "admin"

    def index
        @modulo = "Lista de Reservas"
        @reservas = Reserva.all
    end
end
