class RemoveEmailFromFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :email, :string
  end
end
