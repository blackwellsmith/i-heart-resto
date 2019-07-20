class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to  reviews_path
      else
        flash[:error] = "Sorry, your username and password don't match our records"
        redirect_to '/login' 
      end
    end

    def home
    end

    def destroy
    session.clear 
    redirect_to '/'
    end

end