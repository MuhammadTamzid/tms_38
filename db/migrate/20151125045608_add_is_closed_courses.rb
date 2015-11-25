class AddIsClosedCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :is_finished
    add_column :courses, :is_closed, :boolean, default: false
  end
end
