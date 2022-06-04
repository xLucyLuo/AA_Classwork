class UsersController < ApplicationController
    before_action :require_logged_in, only:[:show, :edit, :update, :destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def index
        @users = User.all
        render :index
    end

    def show 
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        #debugger
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to subs_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end


    # def edit
    #     @user = User.find_by(id: params[:id])
    #     render :edit
    # end

    # def update
    #     @user = User.find_by(id: params[:id])
    
    # end

    

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end









