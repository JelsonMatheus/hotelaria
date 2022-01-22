class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :data_reserva, null: false
      t.datetime :check_in, null: false
      t.datetime :check_out, null: false
      t.integer :preco, null: false
      t.belongs_to :hotel, foreign_key: true

      t.timestamps
    end
  end
end
