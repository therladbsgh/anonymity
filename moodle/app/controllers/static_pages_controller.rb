class StaticPagesController < ApplicationController

    def home
    end

    def courses
        @moodle = Moodle::Api.configure do |c|
            c.host = 'anonymizemetest.moodlecloud.com'
            c.token = current_user.token
        end

        @params_1 = { 'criteria[0][key]' => 'username',
            'criteria[0][value]' => current_user.username }
        @moodle_user = Moodle::Api.core_user_get_users(@params_1)
        @id = params[:user_id]
    end

    def assignments
    end

    def submissions
    end

end
