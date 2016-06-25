class Account < ApplicationRecord
  belongs_to :user, inverse_of: :account

  validates :subscribed, presence: true
  validates :credits, presence: true
end
