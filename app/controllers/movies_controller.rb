class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

    def index
        @movies = Movie.order('created_at DESC')
    end

    def show
        @movie = Movie.find(params[:id])
    end

  
    def new
        @movie = Movie.new
        @categories = Category.all.map{|c| [ c.name, c.id ] }
    end

    def edit
        @categories = Category.all.map{|c| [ c.name, c.id ] }
    end

    def create
    
        @movie = Movie.new(movie_params)
        @movie.category_id = params[:category_id]
        @movie.user = current_user
        respond_to do |format|
            if @movie.save
                format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
                format.json { render :show, status: :created, location: @movie }
            else
                format.html { render :new }
                format.json { render json: @movie.errors, status: :unprocessable_entity }
            end
        end
    end


    def update
        @movie.category_id = params[:category_id]
        respond_to do |format|
            if @movie.update(movie_params)
                format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
                format.json { render :show, status: :ok, location: @movie }
            else
                format.html { render :edit }
                format.json { render json: @movie.errors, status: :unprocessable_entity }
            end
        end
    end

    def favorite
        type = params[:type]
        if type == "favorite"
          current_user.favorites << @movie
          redirect_to :back, notice: 'You favorited #{@movie.title}'
    
        elsif type == "unfavorite"
          current_user.favorites.delete(@movie)
          redirect_to :back, notice: 'Unfavorited #{@movie.title}'
    
        else
          # Type missing, nothing happens
          redirect_to :back, notice: 'Nothing happened.'
        end
      end
    
    

  
    def destroy
        @movie.destroy
        respond_to do |format|
            format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    
        



    private
   
    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :description, :director, :stars, :release, :mov_rating, :Run_time, :image)
    end
    
    def add_current_user
        unless user_signed_in?
        
        redirect_to user_session_path
        flash[:danger] = "please sign in"
    end
end

end
