class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories, id: :uuid do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
