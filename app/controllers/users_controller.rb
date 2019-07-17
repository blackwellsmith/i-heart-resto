class UsersController < ApplicationController

    #loading sign up form
    def new 
        @user = User.new
    end
    
    #signup
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to reviews_path #path? show page index?
      else
        render :new
      end
    end

    private

    def user_params
       params.require(:user).permit(:username, :email, :password) 
    end
end
