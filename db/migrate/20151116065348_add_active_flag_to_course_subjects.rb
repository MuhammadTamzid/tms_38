class AddActiveFlagToCourseSubjects < ActiveRecord::Migration
  def change
    add_column :course_subjects, :active_flag, :integer, default: 1
  end
end
