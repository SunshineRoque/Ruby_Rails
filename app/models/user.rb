class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :feedbacks
  has_many :comments
  enum genre: { client: 0, admin: 1 }
  has_many :cat_facts
  validates :name, presence: true
  validates :phone_number, presence: true
end
