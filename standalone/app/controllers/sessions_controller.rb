class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            flash[:success] = "Successfully signed in!"
            redirect_to '/'
        else
            flash[:warning] = "There was an error while signing in."
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Logged out successfully."
        redirect_to '/'
    end

end
