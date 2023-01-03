# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Database creation
* Criação de Modelos: Toda vez que criar uma tabela adicionar os seguintes campos (deleted_at como datetime e adicioanr um index para esta), pois serve de parâmetro para o soft delete, exemplo:
```
  class AddDeletedAtToClients < ActiveRecord::Migration
  def change
    add_column :clients, :deleted_at, :datetime
    add_index :clients, :deleted_at
  end
end
```
Outro exemplo:
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
Não esquecer de adicionar o helper `acts_as_paranoid` nos models para o funcionamento dos métodos. Maiores informações na documentação [Paranoia](https://github.com/rubysherpas/paranoia).

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
