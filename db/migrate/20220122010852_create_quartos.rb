class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quarto_tipos do |t|
      t.string :nome, limit: 50, null: false

      t.timestamps
    end

    create_table :quartos do |t|
      t.belongs_to :hotel, foreign_key: true, null: false
      t.belongs_to :quarto_tipo, foreign_key: true, null: false
      t.integer :numero, null: false
      t.string :descricao, limit: 300, null: false
      t.integer :capacidade, null: false
      t.decimal :preco, precision: 5, scale: 2, null: false
      t.boolean :reservado, default: false, null: false
      
      t.timestamps
    end
  end
end
