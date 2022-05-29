class UsersController < ApplicationController
    def index
        # render json: params
        if params.has_key?(:username)
            username = params[:username]
            @users = User.where("username ILIKE ?", "%#{username}%")
        else
            @users = User.all
        end
        render json: @users
        # render plain: "I'm in the index action!"
    end
    
    def create
        # render json: params
        @user = User.new(user_params)

        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end

    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end