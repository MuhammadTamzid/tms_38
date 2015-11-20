class CompletedTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_subject
  belongs_to :task

  scope :filter_by_user, ->user{where user_id: user.id}
end
