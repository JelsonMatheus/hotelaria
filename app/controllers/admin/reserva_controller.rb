class Admin::ReservaController < ApplicationController
    layout "admin"

    def index
        @modulo = "Lista de Reservas"
    end
end
