require_relative '../../reports/generate_pdf'
require_relative '../../reports/generate_csv'

class Admin::HospedeController < ApplicationController
    layout "admin"
    
    def index
        @modulo = "Lista de Hospedes"
        @hospede = Cliente.all.page params[:page]
        @hospede  = @hospede.filter_by_starts_with(params[:nome]) if params[:nome].present?
    end

    def show
        @hospede = Cliente.find(params[:id])
    end
      
    def destroy
        Cliente.find_by(id: params[:id]).destroy
        redirect_to admin_hospede_index_path
    end

    def new
        @modulo = "Adicionar Hospedes"
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
        @modulo = "Editar Hospedes"
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

    def export
      @hospedes = Cliente.all
      @hospede  = @hospede.filter_by_starts_with(params[:nome]) if params[:nome].present?
  
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
      def hospede_params
        params.require(:cliente).permit(:nome, :telefone, :cpf, :email)
      end   

      def send_pdf
        colsname = {nome: 'Nome', telefone: 'Telefone', cpf:'CPF', email:'Email'}
        widths = [135, 135, 135, 135]

        relatorio = GeneratePdf.new("Lista de Hospedes", @hospedes, colsname, widths)
        pdf = relatorio.pdf
        send_data(pdf, filename: 'relatorio.pdf', type: 'application/pdf', disposition: :inline)
      end

      def send_csv
        colsname = {nome: 'Nome', telefone: 'Telefone', cpf:'CPF'}

        relatorio = GenerateCsv.new( @hospedes, colsname)
        csv = relatorio.csv
        send_data(csv, filename:'relatorio.csv', type:'text/csv')
    end


end
