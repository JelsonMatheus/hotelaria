class Admin::HospedeController < ApplicationController
    layout "admin"
    
    def index
        @modulo = "Lista de Hospedes"
        @hospede = Cliente.all.page params[:page]
    end
end
