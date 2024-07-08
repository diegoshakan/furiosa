class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }

      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
