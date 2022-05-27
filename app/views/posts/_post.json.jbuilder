json.extract! post, :id, :name, :type, :date, :time, :location, :detail, :created_at, :updated_at
json.url post_url(post, format: :json)
