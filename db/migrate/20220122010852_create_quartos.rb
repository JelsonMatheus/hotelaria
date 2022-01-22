class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quartos do |t|
      t.integer :numero, null: false
      t.string :tipo, null: false # Deixa os tipos predefinidos ex: [Suite, Comum]
      t.string :descricao, limit: 300, null: false
      t.integer :capacidade, null: false
      t.boolean :reservado, default: false
      t.belongs_to :hotel, foreign_key: true

      t.timestamps
    end
  end
end
