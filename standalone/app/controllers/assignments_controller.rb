class AssignmentsController < ApplicationController

    before_filter :get_course

    def index
        @assignments = @course.assignments.all
    end

    def show
        @course = Course.find(params[:course_id])
        @assignments = @course.assignments.all
    end

    def new
        @course = Course.find(params[:course_id])
        @assignment = @course.assignments.new
    end

    def create
        @assignment = Assignment.new(assignment_params)
        if @assignment.save
            session[:assign_id] = @assignment.id
            flash[:success] = "Successfully created assignment."
            redirect_to course_path(@assignment.course_id)
        else
            flash[:warning] = "An error occurred. Check for any mistakes?"
            redirect_to new_course_assignment_path(@course)
        end
    end

    private
    def assignment_params
        params.require(:assignment).permit(:name, :description, :course_id, :online)
    end

    def get_course
        @course = Course.find(params[:course_id])
    end

end
