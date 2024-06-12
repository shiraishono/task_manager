class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :text, null: false
      t.references :user, null: false, foreign_key: true
      t.references :parent_task, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
