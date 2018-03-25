class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :movies
    has_many :favorite_movies, dependent: :destroy
    has_many :favorites, through: :favorite_movies, source: :movie
    
    def favorite_for(movie)
      favorite_movies.where(movie: movie).first
    end


    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_attached_file :image, :styles => {
        :large => "400x400>",
        :medium => "300x300>",
        :thumb => "100x100#"
        }
        validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
