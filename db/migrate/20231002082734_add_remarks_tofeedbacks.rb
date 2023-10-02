class AddRemarksTofeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :remarks, :integer, default: 0, null: false
  end
end
