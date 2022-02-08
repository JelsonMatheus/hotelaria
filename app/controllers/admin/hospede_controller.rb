class Admin::HospedeController < ApplicationController
    layout "admin"
    
    def index
        @modulo = "Lista de Hospedes"
        @hospede = Cliente.all.page params[:page]
    
    end

    def show
        @hospede = Cliente.find(params[:id])
    end
      
    def destroy
        Cliente.find_by(id: params[:id]).destroy
        redirect_to admin_hospede_index_path
    end

    def new
        

    end    
end
