class Feedback < ApplicationRecord
  validates :subjetc, presence: true
  validates :message, presence: true
  validates :remarks, presence: true

  enum :remarks, {
    Good: 1,
    Bad: 3,
    Neutral: 2,
    Unmarked: 0
  }

  has_many :notes
  belongs_to :user
end