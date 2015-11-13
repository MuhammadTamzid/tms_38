class RemoveActiveFlagCourseSubjects < ActiveRecord::Migration
  def change
    remove_column :course_subjects, :active_flag
  end
end
