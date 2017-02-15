class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Successfully signed up!"
            redirect_to '/'
        else
            flash[:warning] = "There is an error in the form. Check any mistakes."
            redirect_to '/signup'
        end
    end

    def index
        @users = User.all
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :rank)
    end

end
