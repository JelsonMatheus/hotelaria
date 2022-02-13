class Admin::QuartoController < ApplicationController
  layout "admin"
  def index 
    @modulo = "Lista de Quartos"
    @quartos = Quarto.all.page params[:page]
  end

  def new
    @modulo = "Adicionar Quarto"
    @quarto = Quarto.new
  end

  def create
    @quarto = Quarto.new(quarto_params)
    if @quarto.save
      redirect_to admin_quarto_index_path
    else
      render :new
    end
  end

  def edit
    @modulo = "Editar Quarto"
    @quarto = Quarto.find(params[:id])
  end

  def update
    @quarto = Quarto.find(params[:id])

    if @quarto.update(quarto_params)
      redirect_to admin_quarto_index_path
    else
      render :edit
    end
  end

  private
    def quarto_params
      params.require(:quarto).permit(:hotel_id, :quarto_tipo_id, :numero, :descricao, :capacidade, :preco, :reservado)
    end
end
