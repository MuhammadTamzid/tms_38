class Supervisor::CourseSubjectsController < ApplicationController
  def show
    @course_subject = CourseSubject.find_by_course_id_and_subject_id params[:course_id], params[:subject_id]
    @course = @course_subject.course
    @subject = @course_subject.subject
    @tasks = @subject.tasks
  end

  def update
  end
end
