json.extract! wishlist, :id, :name, :description, :picture, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
