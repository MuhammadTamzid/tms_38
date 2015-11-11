class Supervisor::CoursesController < ApplicationController
  before_action :load_course, except: [:index, :new, :create]

  def index
    @courses= Course.all.paginate page: params[:page], per_page: 10
  end

  def show
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
    params.require(:course).permit :name, :description, :start_date, :end_date
  end

  def load_course
    @course = Course.find params[:id]
  end
end
