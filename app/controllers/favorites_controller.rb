class FavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_movie
  
    def create
        @movie = Movie.find(params[:movie_id])
        @favorite = @movie.favorite_movies.new
        @favorite.user = current_user
  
        if @favorite.save
            redirect_to @movie, notice: "Thank you for favoriting"
        else
            redirect_to @movie, alert: "You already favorite this movie."
        end
    end
  
    def destroy
        @favorite = current_user.favorites.find(params[:id])
        
        if @favorite.destroy
          redirect_to @movie, alert: "You have unfavorited"
        else
          redirect_to @movie, alert: "Couldn't unfavorite"
        end
      end
    
      private
    
      def find_movie
        @movie = Movie.find(params[:movie_id])
    end

   
    
    end
    