class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements, id: :uuid do |t|
      t.string :title
      t.string :code
      t.text :description
      t.string :value
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
