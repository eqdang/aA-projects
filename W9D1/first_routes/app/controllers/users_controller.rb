class UsersController < ApplicationController

    def index
        # render plain: 'Hello, World!!!'
        render json: User.all 
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        # user = User.new(params[:username])
        user = User.new(username: params[:username])
        if user.save
            render json: user 
        else
            render json: user.errors.full_messages, status:422
        end

        # user = User.new(params.require(:user).permit(:username))
        # if user.save!
        #     render json: user 
        # else
        #     render json: user.errors.full_messages, status: :unprocessable_entity
        # end
    end
    
    def update
        user = User.find(params[:id])
        user.username = params[:username]
        if user.save
            render json: user 
        else
            render json: user.errors.full_messages, status:422
        end
    end

    def destroy

        user = User.find(params[:id])
        user.destroy
        render json: "succesfully deleted"

    end

    private
    def user_params
        params.require(:username).permit(:username)
    end

end