class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :movies
    has_many :favorite_movies
    has_many :favorites, through: :favorite_movies, source: :movie
  
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_attached_file :image, :styles => {
        :large => "400x400>",
        :medium => "300x300>",
        :thumb => "100x100#"
        }
        validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
