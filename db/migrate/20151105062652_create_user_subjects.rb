class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course_subject, index: true, foreign_key: true
      t.boolean :is_finished

      t.timestamps null: false
    end
  end
end
