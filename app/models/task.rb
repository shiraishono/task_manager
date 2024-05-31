class Task < ApplicationRecord
  belongs_to :user
  has_many :child_tasks, class_name: 'Task', foreign_key: 'parent_task_id', dependent: :destroy
  belongs_to :parent_task, class_name: 'Task', optional: true

  accepts_nested_attributes_for :child_tasks, allow_destroy: true
end
