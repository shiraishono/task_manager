class Task < ApplicationRecord

  belongs_to :user
  belongs_to :parent_task, class_name: "Task", optional: true
  has_many :subtasks, class_name: "Task", foreign_key: "parent_task_id", dependent: :destroy

  
  validates :text, presence: true
end
