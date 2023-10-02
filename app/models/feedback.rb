class Feedback < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :subjetc, presence: true
  validates :message, presence: true
end