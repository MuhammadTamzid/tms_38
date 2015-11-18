class Course < ActiveRecord::Base
  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_subjects
  has_many :completed_tasks, through: :user_subjects
  has_many :tasks, through: :subjects

  validates :name, presence: true, length:{minimum: 3},
                                   uniqueness: {case_sensitive: false}
  validates :description, presence: true, length:{minimum: 10}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :dates_check

  accepts_nested_attributes_for :course_subjects, allow_destroy: true

  def dates_check
    if start_date > end_date
      errors.add(:start_date, I18n.t("date_check_text"))
    end
  end

  def get_subjects_for_course
    course_subjects_hash = Hash.new
    course_subjects = self.course_subjects
    course_subjects.each do |course_subject|
      course_subjects_hash[course_subject.subject_id] = course_subject
    end
    subjects = Subject.all
    return_course_subjects = Array.new
    if subjects.present?
      subjects.each do |subject|
        if course_subjects_hash.has_key? subject.id
          course_subject = course_subjects_hash[subject.id]
        else
          course_subject = CourseSubject.new subject_id: subject.id
        end
        return_course_subjects << course_subject
      end
    end
    return_course_subjects
  end
end
