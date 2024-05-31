class Task < ApplicationRecord
  belongs_to :user
  belongs_to :parent_task, class_name: 'Task', optional: true
  has_many :child_tasks, class_name: 'Task', foreign_key: 'parent_task_id', dependent: :destroy

  validates :title, presence: true
end
