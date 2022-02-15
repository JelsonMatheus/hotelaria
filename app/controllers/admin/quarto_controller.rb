require_relative '../../reports/generate_pdf'
require_relative '../../reports/generate_csv'

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

  def export
    @quartos = Quarto.all

    respond_to do |format|
      format.pdf do
        send_pdf
      end
      format.csv do
        send_csv
      end
    end
  end

  private
    def quarto_params
      params.require(:quarto).permit(:hotel_id, :quarto_tipo_id, :numero, :descricao, :capacidade, :preco, :reservado)
    end
    def send_pdf
      itens = []
      for quarto in @quartos do
        puts quarto.inspect
        item = {
          hotel:quarto.hotel.nome,
          quarto_tipo:quarto.quarto_tipo.nome,
          numero:quarto.numero,
          capacidade:quarto.capacidade,
          preco:quarto.preco
        }
        
        itens.push(item)
      end
      colsname = {hotel: 'Hotel', quarto_tipo: 'Quarto Tipo', numero:'Numero', capacidade:'Capacidade', preco:'Preço'}
      widths = [90,90,90,90,90,90]

      relatorio = GeneratePdf.new("Lista de Hoteis", itens, colsname, widths)
      pdf = relatorio.pdf
      send_data(pdf, filename: 'relatorio.pdf', type: 'application/pdf', disposition: :inline)
  end

    def send_csv
      colsname = {hotel_id: 'Hotel', quarto_tipo_id: 'Quarto tipo', preco:'Preco'}

      relatorio = GenerateCsv.new( @quartos, colsname)
      csv = relatorio.csv
      send_data(csv, filename:'relatorio.csv', type:'text/csv')
    end

end
