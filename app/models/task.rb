class Task < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  validates :activity, presence: true
  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :processing, :completed, :canceled

    event :process do
      transitions from: :pending, to: :processing
    end

    event :complete do
      transitions from: :processing, to: :completed
    end

    event :cancel do
      transitions from: :processing, to: :canceled
    end
  end
end
