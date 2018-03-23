class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :favorite_movies
    has_many :favorited_by, through: :favorite_movies, source: :user 
end
