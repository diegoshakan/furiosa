json.extract! address, :id, :user_id, :state, :city, :neighborhood, :street, :number, :zipcode, :reference_point, :created_at, :updated_at
json.url address_url(address, format: :json)
