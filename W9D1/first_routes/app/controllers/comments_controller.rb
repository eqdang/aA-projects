class CommentsController < ApplicationController

    def index
        render json: Comment.all
    end

    def create

    end

    def destroy

    end

end