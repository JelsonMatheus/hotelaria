module Admin::HotelHelper
  def exibir_endereco(item)
    "#{item.estado}/#{item.cidade}/#{item.rua}"
  end

end
