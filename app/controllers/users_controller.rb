class UsersController < ApplicationController
    before_action :current_user, unless: :devise_controller?
    before_action :authenticate_user!, if: :devise_controller?
    def index
        @users = User.order('created_at DESC')
        @users = User.paginate(:per_page => 10, :page => params[:page])
    end
    
    def show
        @user = User.find(params[:id])
    end
end
