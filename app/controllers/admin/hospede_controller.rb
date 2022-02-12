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
        @hospede = Cliente.new
    end

    def create
        @hospede = Cliente.new(hospede_params)
        if @hospede.save
          redirect_to admin_hospede_index_path
        else
          render :new
        end
    end 

    def edit
        @hospede = Cliente.find(params[:id])
    end
  
    def update
      @hospede = Cliente.find(params[:id])
  
      if @hospede.update(hospede_params)
        redirect_to admin_hospede_index_path
      else
        render :edit
      end
    end

    private
        def hospede_params
           params.require(:cliente).permit(:nome, :telefone, :cpf, :email)
        end   
end
