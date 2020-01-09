class SessionsController < ApplicationController

  def 
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials( comment_params[:id])

    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['EHHHH TRY AGAIN']
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to new_session_url
  end
end
