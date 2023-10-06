class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  paginates_per 5

  belongs_to :user

  # def destroy
  #   update(deleted_at: Time.now)
  # end
end