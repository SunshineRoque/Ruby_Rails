class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :user
      t.references :activity
      t.string :state
      t.timestamps
    end
  end
end
