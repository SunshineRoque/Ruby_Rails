class AddUserIdToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :user
  end
end
