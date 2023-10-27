class AddActivityIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :activity, foreign_key: true
  end
end
