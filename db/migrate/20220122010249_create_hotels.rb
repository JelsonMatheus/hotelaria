class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :nome, limit:200, null: false
      t.string :telefone, limit:14, null: false
      t.string :pais, limit:150, null: false
      t.string :cidade, limit:150, null: false
      t.string :estado, limit:150, null: false
      t.string :rua, limit:200, null: false
      
      t.timestamps
    end
  end
end
