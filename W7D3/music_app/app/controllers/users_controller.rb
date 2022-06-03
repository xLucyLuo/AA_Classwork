class UsersController < ApplicationController
    before_action :require_no_user!, only: [:create, :new]
    before_action :require_user!, only: [:show]

    def new
        @user = User.new
        render :new
    end
    
    def create
        @user = User.new(user_params)
        #debugger
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            #put errors
            #render json: params
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end 
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
