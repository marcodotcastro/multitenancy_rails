json.extract! author, :id, :slug, :name, :description, :created_at, :updated_at
json.url author_url(author, format: :json)
