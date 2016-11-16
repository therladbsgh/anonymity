class SubmissionsController < ApplicationController

    before_filter :get_assignment

    def index
        @submissions = @assignment.submissions.all
        @course = Course.find(params[:course_id])
    end

    def show
        @assignment = Assignment.find(params[:assignment_id])
        @submissions = Submission.find(params[:id])
    end

    def edit
        @course = Course.find(params[:course_id])
        @assignment = Assignment.find(params[:assignment_id])
        @submission = Submission.find(params[:id])
    end

    def update
        @course = Course.find(params[:course_id])
        @submission = Submission.find(params[:id])
        @submission.grade = params[:grade]
        if @submission.update(submission_params)
            redirect_to course_assignment_submissions_path(@course.id, @assignment.id)
        else
            redirect_to edit_course_assignment_submission_path
        end
    end

    def new
        @course = Course.find(params[:course_id])
        @submission = @assignment.submissions.new
    end

    def create
        @submission = Submission.new(submission_params)
        if @submission.save
            if already_submitted_once(current_user.id, params[:assignment_id])
                @magic = Magic.find_by_user_id_and_assignment_id(current_user.id, params[:assignment_id])
                @submission.magic_id = @magic.id
                @submission.save
            else
                @magic ||= Magic.new({user_id: current_user.id, assignment_id: @assignment.id})
                @magic.magic_word ||= @magic.generate_magic_word
                @magic.save
                @submission.magic_id = @magic.id
                @submission.save
            end
            session[:assign_id] = @submission.id
            redirect_to course_assignment_submissions_path
        else
            redirect_to new_assignment_submission_path(@assignment)
        end
    end

    private
    def submission_params
        params.require(:submission).permit(:content, :assignment_id, :course_id, :magic_id, :grade)
    end

    def get_assignment
        @assignment = Assignment.find(params[:assignment_id])
    end

    def already_submitted_once(current_user_id, assignment_id)
        if Magic.find_by_user_id_and_assignment_id(current_user_id, assignment_id) != nil
            return true
        end
        return false
    end

end
