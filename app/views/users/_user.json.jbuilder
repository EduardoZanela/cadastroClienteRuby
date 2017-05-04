json.extract! user, :id, :name, :city, :province, :country, :birth_date, :civil, :sex, :profession, :created_at, :updated_at
json.url user_url(user, format: :json)
