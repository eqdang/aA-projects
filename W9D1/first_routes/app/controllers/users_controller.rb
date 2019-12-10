class UsersController < ApplicationController

    def index

        # render plain: 'Hello, World!!!'
        render json: User.all 

    end

    def show

        render json: params

    end

    def create
        # user = User.new(user_params)
        # user = User.new(params.require(:user).permit(:name, :email))
        
            # replace the `user_attributes_here` with the actual attribute keys
        user = User.new
        user.name = params[:name]
        user.email = params[:email]

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
       
    end

    def update

        render json: params

    end


    private

    def user_params
        params.require(:user).permit(:name, :email)
    end

end

# class CatsController < ActionController::Base
#   # Using "Cat.create(params[:cat])" would raise an
#   # ActiveModel::ForbiddenAttributes exception because it'd be using
#   # mass assignment without an explicit permit step.
#   # This is the recommended form:
#   def create
#     Cat.create!(cat_params)
#   end

#   # This will pass with flying colors as long as there's a cat key in
#   # the parameters, otherwise it'll raise an
#   # ActionController::MissingParameter exception, which will get
#   # caught by ActionController::Base and turned into a 400 Bad Request
#   # reply.
#   def update
#     # params[:id] is a routing parameter; more in a sec!
#     @cat = Cat.find(params[:id])
#     @cat.update!(cat_params)
#     render json: @cat
#   end

#   private

#   # Using a private method to encapsulate the permissible parameters
#   # is just a good pattern since you'll be able to reuse the same
#   # permit list between create and update. Also, you can specialize
#   # this method with per-user checking of permissible attributes.
#   def cat_params
#     params.require(:cat).permit(:name, :age)
#   end
# end