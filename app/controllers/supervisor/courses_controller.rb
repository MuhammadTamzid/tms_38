class Supervisor::CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses = Course.get_courses(params[:user_id])
                     .paginate page: params[:page], per_page: 10
  end

  def show
    @supervisors = @course.supervisors
    @trainees = @course.trainees
    @subjects = @course.subjects
    @user_subjects = @course.user_subjects
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t 'course_creation_text'
      redirect_to [:supervisor, @course]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t 'course_update'
      redirect_to [:supervisor, @course]
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = t 'course_delete'
    redirect_to supervisor_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      course_subjects_attributes: [:id, :subject_id, :_destroy]
  end

  def load_course
    @course = Course.find params[:id]
  end
end
