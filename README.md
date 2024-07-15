# Furiosa

Click here to visit: [Furiosa](https://fly.io/apps/furiosa) (for now off)

## Setup Project

* $ git clone https://github.com/diegoshakan/furiosa.git
* $ cd furiosa
* $ rails db:create db:migrate db:seed
* $ bundle install
* $ ./bn/dev  
TailwindCSS is the framework that I choose to this project. So use the command above to see your changes with Tailwind.

## Database creation
* Model Creation: Every time you create a table add the following fields (deleted_at such as datetime and add an index to this), as it serves as a parameter for soft delete, example:
```
  class AddDeletedAtToClients < ActiveRecord::Migration
    def change
      add_column :customers, :deleted_at, :datetime
      add_index :customers, :deleted_at
    end
  end
```
* Another way:
```
class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true, type: :uuid
      
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
```
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

Don't forget to add the `acts_as_paranoid` helper to the models for the methods to work. Further information in the documentation [Paranoia](https://github.com/rubysherpas/paranoia).

## Rubocop
* After finish a commit, for example, please run `rubocop -a` to adjustment your code to keep a pattern of sintax.
