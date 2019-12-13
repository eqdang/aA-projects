class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        if @current_user
            return @current_user
        else
            @current_user = User.find_by(session_token: session[:session_token])
        end
    end

    # def login_user!
    #    redirect_to  
    # end

    def require_user
        if current_user.nil?
            redirect_to new_session_url
        end
    end

    def no_user
        if current_user
            redirect_to cats_url
        end
    end

    

    
end
