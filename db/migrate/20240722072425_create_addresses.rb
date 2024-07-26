class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :city, null: false
      t.string :complement
      t.string :number
      t.string :reference_point
      t.string :street, null: false
      t.string :uf, null: false
      t.string :zip_code, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
