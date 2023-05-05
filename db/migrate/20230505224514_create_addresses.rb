class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :city
      t.string :complement
      t.string :neighborhood
      t.string :number
      t.string :state
      t.string :street
      t.string :zip_code
      t.references :user, type: :uuid, foreign_key: true

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
