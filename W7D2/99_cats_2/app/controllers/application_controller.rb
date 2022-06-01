class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?

    before_action :require_logged_out, only: [:new, :create]

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def logout!
        @current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_out
        redirect_to cats_url if logged_in?
    end
end
