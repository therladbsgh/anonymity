class SessionsController < ApplicationController

    def new
    end

    def create
        @parse_response = HTTParty.get "https://" +
        "anonymizemetest.moodlecloud.com/login/token.php?" +
        "username=" + params[:session][:username] +
        "&password=" + params[:session][:password] +
        "&service=moodle_rails_service"
        if @parse_response["token"] != nil
            @user = User.find_by_username(params[:session][:username])
            if @user
                @user.update({token: @parse_response["token"]})
                session[:user_id] = @user.id
            else
                @user_new = User.new({username: params[:session][:username],
                    token: @parse_response["token"]})
                @user_new.save
                session[:user_id] = @user_new.id
            end
            redirect_to '/'
        else
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

end
