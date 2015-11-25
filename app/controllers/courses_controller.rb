class CoursesController < ApplicationController
  before_action :load_course, except: [:index]

  def index
    @courses = current_user.courses
  end

  def show
    @supervisors = @course.supervisors
    @trainees = @course.trainees
    @subjects = @course.subjects
    @user_subjects = @course.user_subjects
  end

  private
  def load_course
    @course = current_user.courses.find params[:id]
  end
end
