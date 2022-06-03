class BandsController < ApplicationController
    def index
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            flash[:errors] = @band.errors.full_messages
            redirect_to new_band_url
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            flash[:error] = @band.errors.full_messages
            redirect_to new_band_url
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.destroy
        redirect_to user_url(current_user)
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
