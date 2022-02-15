require "prawn/table"
require "prawn"

class GeneratePdf
    def initialize(title, itens, colsname, widths)
        @title = title
        @colsname = colsname
        @itens = itens
        @widths = widths
    end

    def pdf
        data = get_data()

        Prawn::Document.new do |pdf|
            pdf.text @title, :align => :center, :font_size => 14, :style => :bold
            pdf.move_down 20
            pdf.font_size 10
            pdf.table (data) do |t|
                t.position = :center
                t.column_widths = @widths
                t.row(0).background_color = "AAFFAA"
            end
        end.render
    end

    private
        def get_data
            keys = @colsname.keys
            data = [@colsname.values,]

            for item in @itens do
                values = []
                for key in keys do
                    values.push(item[key])
                end
                data.push(values)
            end

            return data
        end
end