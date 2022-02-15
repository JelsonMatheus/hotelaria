require 'csv'

class GenerateCsv
  def initialize(itens,colsnames)
    @itens = itens
    @colsnames = colsnames
  end

  def csv
    csv_data = CSV.generate(headers: true) do |csv|
      csv_string = CSV.generate do |csv| 
        csv << @colsnames.values 
        for item in @itens do
          valor_att = []
          for colsname in @colsnames.keys do
            valor_att.push(item[colsname].to_s)
          end
          csv << valor_att
        end
      end
      

      return csv_string
    end
  end

end