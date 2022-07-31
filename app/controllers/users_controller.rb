class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :index, :edit, :update]

    def new
        @user = User.new
        render :new 
    end 

    def index 
        @users = User.all
        render :index
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def edit 
        @user = User.find_by(id: params[:id])
        render :edit 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        render :show
    end 

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else 
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def destroy
        @user = User.find_by(id: params[:id])
        if @user.destroy
            render :new
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password, :nickname)
    end 

end
