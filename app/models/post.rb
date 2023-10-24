class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  enum status: { published: 0, unpublished: 1, archived: 2}
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  paginates_per 5

  belongs_to :user

  belongs_to :region, class_name: 'Address::Region', foreign_key: 'address_region_id'
  belongs_to :province, class_name: 'Address::Province', foreign_key: 'address_province_id'
  belongs_to :city, class_name: 'Address::City', foreign_key: 'address_city_id'
  belongs_to :barangay, class_name: 'Address::Barangay', foreign_key: 'address_barangay_id'
end
