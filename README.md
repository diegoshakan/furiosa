# Furiosa

Click here to visit: [Furiosa](https://fly.io/apps/furiosa)

## Setup Project

* $ git clone https://github.com/diegoshakan/furiosa.git
* $ cd furiosa
* $ rails db:create db:migrate
* $ bundle install
* $ ./bin/dev  
TailwindCSS is the framework that I choose to this project. So use the command above to see your changes with Tailwind.

## To Run Elasticsearch locally
Furiosa use Elasticsearch to index and return a fast search from announcements. So for search to work fine, you must to run
the ES, ok!?
I don't know if when you to run the project in first time, if you will need reindex the model Announcement in your rails console.
But if to must, run in your rails console: ```Announcement.reindex```.

```
$ docker run --name elasticsearch -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.17.8
```

## Database creation
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
