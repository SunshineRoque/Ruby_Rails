class RemoveNameFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :name, :string
  end
end
