class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :course
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :activities, dependent: :destroy

  validates :user_id, uniqueness: {scope: [:subject_id, :course_id]}

  scope :search_by_subject, ->subject_id{where subject_id: subject_id}
  scope :search_by_user, ->user_id{where user_id: user_id}
end
