class NotesController < ApplicationController
    before_action :require_logged_in, only: [:create, :edit, :update]

    def create 
        @note = Note.new(note_params)
        @note.user_id = params[:user_id]

        if @note.save
            
        else
            flash[:errors] = @note.errors.full_messages
        end
        redirect_to user_url(params[:user_id])
    end

    def edit
        @note = Note.find_by(id: params[:id])
        render :edit
    end

    def update
        @note = current_user.notes.find_by(id: params[:id])

        if !@note 
            flash[:errors] = ['Something went wrong!']
            redirect_to users_url
        elsif @note.update(note_params)
            redirect_to user_url(current_user)
        else
            # flash.now[:errors] = @note.errors.full_messages
            flash.now[:errors] = ['Something went wrong!']
            render :edit
        end
    end

    private
    def note_params
        params.require(:note).permit(:title, :description, :secret)
    end
end
