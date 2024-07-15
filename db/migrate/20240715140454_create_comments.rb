class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :announcement, null: false, foreign_key: true, type: :uuid

      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
