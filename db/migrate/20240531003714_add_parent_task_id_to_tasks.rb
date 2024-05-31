class AddParentTaskIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :parent_task_id, :integer
    add_index :tasks, :parent_task_id
  end
end
