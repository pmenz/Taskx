class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :description
      t.integer :user_id
      t.string  :due
      t.string  :status
    end
  end
end
