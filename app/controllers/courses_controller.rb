class CoursesController < ApplicationController

    before_action :require_user, only: [:index, :show]

    def index
        @courses = Course.all
        @user = User.find_by_id(current_user.id)
    end

    def show
        @course = Course.find(params[:id])
        @assignments = @course.assignments.all
        @user = User.find_by_id(current_user.id)
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        @course.users << current_user
        if @course.save
        session[:course_id] = @course.id
            redirect_to '/'
        else
            redirect_to '/courses/new'
        end
    end

    def edit_users
        @user = User.all
        @course = Course.find(params[:id])
        @current_users = @course.users
    end

    def update_users
        @user = User.find_by_email(params[:email])
        @course = Course.find(params[:id])
        if @user != nil
            @course.users << @user
            if @course.update({users: @course.users})
                redirect_to edit_users_course_path #course_path
            end
        else
            redirect_to edit_users_course_path
        end
    end

    private
    def course_params
        params.require(:course).permit(:title, :description, :id, :users)
    end

end
