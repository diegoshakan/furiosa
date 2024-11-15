class CreateAnnouncements < ActiveRecord::Migration[8.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :description
      t.string :code
      t.decimal :value
      t.references :user, null: false, foreign_key: true
      t.references :category, foreign_key: true

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
