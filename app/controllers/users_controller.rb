class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end 
  end
  