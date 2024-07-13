class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements, id: :uuid do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :code
      t.decimal :value, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
