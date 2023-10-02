class Feedback < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :subjetc, presence: true
  validates :message, presence: true
  validates :remarks, presence: true

  enum :remarks, {
    Good: 1,
    Bad: 3,
    Neutral: 2,
    Unmarked: 0
  }
end