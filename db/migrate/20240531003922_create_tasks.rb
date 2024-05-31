class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end

    add_index :tasks, :user_id
  end
end

