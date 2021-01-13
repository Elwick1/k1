class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @user
    end

    def new
        @user = User.new
        render json: @user
    end

    def create
        @user = User.new(strong_params)
        if @user.valid?
            @user.save
        render json: @user
        else
            render :new
        end
    end

    def show
        set_user
    end

    def set_user
        @user = User.find(params[:id])
    end

    # def destroy 
    #     set_user
    #     session.destroy
    #     @user.destroy 
    # end

    private

    def strong_params
        params.require(:user).permit(:username, :password, :age)
    end

end
