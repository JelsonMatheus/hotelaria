module Admin::ReservaHelper
    def show_hotel_quarto(reserva)
        quarto = reserva.quarto
        "#{quarto.hotel.nome}/ Quarto #{quarto.numero}"
    end
end
