require_relative '../../reports/generate_pdf'
require_relative '../../reports/generate_csv'
class Admin::ReservaController < ApplicationController
    layout "admin"

    def index
        @modulo = "Lista de Reservas"
        @reservas = Reserva.all.page params[:page]
        @reservas  = @reservas.filter_by_cliente(params[:cliente_id]) if params[:cliente_id].present?
    end

    def new
        @modulo = "Adicionar Reservas"
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
        @modulo = "Editar Reservas"
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

    def export
      @reservas = Reserva.all
      @reservas  = @reservas.filter_by_cliente(params[:cliente_id]) if params[:cliente_id].present?
      
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
      def reserva_params
        params.require(:reserva).permit(:quarto_id, :data_reserva, :check_in, :check_out, :preco_total, :cliente_id)
      end
    
      def send_pdf
        itens = []
        for reserva in @reservas do
          item = {
            cliente:reserva.cliente.nome,
            check_in:reserva.check_in.strftime(" %d/%m/%Y"),
            check_out:reserva.check_out.strftime(" %d/%m/%Y"),
            preco_total:reserva.preco_total
          }
          itens.push(item)
        end
        colsname = {cliente: 'Cliente', check_in: 'Check in', check_out:'Check out', preco_total:'Preço total'}
        widths = [135, 135, 135, 135]

        relatorio = GeneratePdf.new("Lista de Reservas", itens, colsname, widths)
        pdf = relatorio.pdf
        send_data(pdf, filename: 'relatorio.pdf', type: 'application/pdf', disposition: :inline)
      end

      def send_csv
        colsname = {cliente_id: 'Hotel', check_in: 'Check in', check_out:'Check out'}
  
        relatorio = GenerateCsv.new( @reservas, colsname)
        csv = relatorio.csv
        send_data(csv, filename:'relatorio.csv', type:'text/csv')
      end
end
