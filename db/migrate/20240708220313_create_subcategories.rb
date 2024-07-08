class CreateSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :subcategories, id: :uuid do |t|
      t.string :name, null: false, index: true
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
