class Account < ApplicationRecord
  belongs_to :user, inverse_of: :account

  validates :user, presence: true
  validates :user_id, uniqueness: true
  validates :subscribed, inclusion: { in: [true, false] }
  validates :credits, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
