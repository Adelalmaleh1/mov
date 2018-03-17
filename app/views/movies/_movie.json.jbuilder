json.extract! movie, :id, :title, :description, :director, :stars, :release, :created_at, :updated_at
json.url movie_url(movie, format: :json)
