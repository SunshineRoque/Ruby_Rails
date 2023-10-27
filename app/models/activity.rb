class Activity < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :completed, :canceled

    event :cancel do
      transitions from: :pending, to: :canceled, guard: :all_tasks_canceled?
    end

    event :complete do
      transitions from: :pending, to: :completed, guard: :all_tasks_completed?
    end
  end

  private

  def all_tasks_completed?
    tasks.all? { |task| task.completed? || task.canceled? }
  end

  def all_tasks_canceled?
    tasks.all? { |task| task.canceled? || task.completed? }
  end
end
