json.extract! address, :id, :cep, :rua, :numero, :complemento, :ponto_de_referencia, :uf, :cidade, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)
