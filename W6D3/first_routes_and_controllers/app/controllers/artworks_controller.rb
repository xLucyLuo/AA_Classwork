class ArtworksController < ApplicationController
    # def index
    #     @artworks = Artwork.all
    #     render json: @artworks
    # end

    def index
        #if params.has_key?(:user_id)
        @artworks = Artwork.users_artwork(params[:user_id])
        render json: @artworks
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end


    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
