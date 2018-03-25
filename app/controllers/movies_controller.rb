class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

    def index
        @movies = Movie.order('created_at DESC')
        @movies = Movie.paginate(:per_page => 2, :page => params[:page])
    end

    def show
        
        @movie = Movie.find(params[:movie_id] || params[:id])

        @favorite = current_user.favorite_for(@movie)

        @user = User.find(@movie.user_id)
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
		if @movie.save
		flash[:success] = "Movie was successfully created"
		redirect_to movies_path(@mvoie)
		else
		render 'new'
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

    # def favorite
    #     @movie = Movie.find(params[:id])
    #     type = params[:type]
    #     if type == "favorite"
    #       current_user.favorites << @movie
    #       redirect_to :back, notice: 'You favorited #{@movie.name}'
    
    #     elsif type == "unfavorite"
    #       current_user.favorites.delete(@movie)
    #       redirect_to :back, notice: 'Unfavorited #{@movie.name}'
    
    #     else
    #       # Type missing, nothing happens
    #       redirect_to :back, notice: 'Nothing happened.'
    #     end
    # end
    
    

  
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
