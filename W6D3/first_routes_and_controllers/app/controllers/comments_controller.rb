class CommentsController < ApplicationController
    def index
        if params.has_key?(:user_id)
            @comments = Comment.where(user_id: params[:user_id])
        elsif params.has_key?(:artwork_id)
            @comments = Comment.where(artwork_id: params[:artwork_id])
        end

        render json: @comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to comment_url(@comment)
        else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def updates
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to comment_url(@comment)
        else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end



    private
    def comment_params
        params.require(:comment).permit(:user_id, :body, :artwork_id)
    end
end
