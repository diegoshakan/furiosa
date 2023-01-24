json.extract! announcement, :id, :title, :code, :description, :value, :user_id, :category_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
