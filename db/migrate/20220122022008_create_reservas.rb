class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.belongs_to :quarto, foreign_key: true, null: false
      t.datetime :data_reserva, null: false
      t.datetime :check_in, null: false
      t.datetime :check_out, null: false
      t.integer :preco_total, null: false
      
      t.timestamps
    end
  end
end
