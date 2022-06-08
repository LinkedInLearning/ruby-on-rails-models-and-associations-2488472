class CreateTaskAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :task_assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.timestamps
      t.index [:task_id, :user_id]
      t.index [:user_id, :task_id]
    end
  end
end
