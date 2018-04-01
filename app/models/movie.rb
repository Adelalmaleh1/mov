class Movie < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :favorite_movies, dependent: :destroy
    has_many :favorited_by, through: :favorite_movies, source: :user 
    has_many :reviews
   
    has_attached_file :image, :styles => {
        :large => "400x400>",
        :medium => "300x300>",
        :thumb => "100x100#"
    }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
