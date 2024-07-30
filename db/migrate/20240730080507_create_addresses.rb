class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :cep
      t.string :rua
      t.string :numero
      t.string :complemento
      t.string :ponto_de_referencia
      t.string :uf
      t.string :cidade
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
