class Changeusersubject < ActiveRecord::Migration
  def change
    remove_foreign_key :user_subjects, :course_subjects
    remove_reference :user_subjects, :course_subjects, index: true
    remove_column :user_subjects, :course_subject_id
    add_reference :user_subjects, :course, index: true, foreign_key: true
    add_reference :user_subjects, :subject, index: true, foreign_key: true
  end
end
