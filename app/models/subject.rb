class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :users, through: :user_subjects
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :tasks, dependent: :destroy, inverse_of: :subject

  validates :name, presence: true,
                   length: { maximum: 20 },
                   uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: { minimum: 50 }

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|a| a[:name].blank?},
    reject_if: proc {|a| a[:description].blank?}
end
