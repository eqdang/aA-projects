class SessionsController < ApplicationController
    
    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        flash[:success] = "logged out successfully"
        redirect_to new_session_url
    end
    
    before_action :no_user 
    
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user
            session[:session_token] = user.reset_session_token!
            flash[:success] = "Successful log in"
            redirect_to cats_url
        else
            flash[:errors]= "Wrong email/password combo"
            render :new
        end
    end

   


end