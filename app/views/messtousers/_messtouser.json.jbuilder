json.extract! messtouser, :id, :title, :content, :user_id, :created_at, :updated_at
json.url messtouser_url(messtouser, format: :json)