class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.boolean :completed
      t.text :task_name
      t.integer :category
      t.integer :priority

      t.timestamps
    end
  end
end
