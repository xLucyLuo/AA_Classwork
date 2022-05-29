class ArtworkSharesController < ApplicationController
    def index
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def show
        @artwork_share = ArtworkShare.find(params[:id])
        render json: @artwork_share
    end

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        
        if artwork_share.save
            redirect_to artwork_url(@artwork_share)
        else
            render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        @artwork_share = ArtworkShare.find(params[:id])
        
        if @artwork_share.update(artwork_share_params)
            redirect_to artwork_url(@artwork_share)
        else
            render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id])
        @artwork_share.destroy
        render json: @artwork_share
    end
    private

    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end


end
