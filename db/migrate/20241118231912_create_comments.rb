class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :announcement, null: false, foreign_key: true

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
