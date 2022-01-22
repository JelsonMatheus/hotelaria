class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome, limit:200, null: false
      t.string :cpf, limit:14, null: false
      t.string :telefone, limit:14, null: false
      t.string :email, limit:30, null: false
      t.belongs_to :reservas, foreign_key: true

      t.timestamps
    end
  end
end
