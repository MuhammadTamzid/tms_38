class CourseUser < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  belongs_to :trainees, -> {trainees}, class_name: "User",
              foreign_key: "user_id"
  belongs_to :supervisors, -> {supervisors}, class_name: "User",
              foreign_key: "user_id"

  validates :course_id, uniqueness: {scope: :user_id}

  scope :has_user, -> user {find_by user_id: user.id}

  after_save :enroll_user_to_subjects
  after_destroy :delete_user_subjects

  private
  def enroll_user_to_subjects
    course.course_subjects.each do |course_subject|
      user.user_subjects.create subject_id: course_subject.subject_id,
        course_id: course_id
    end
  end

  def delete_user_subjects
    course.user_subjects.search_by_user(user_id).delete_all
  end
end
