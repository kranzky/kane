class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :account

  validates :user, presence: true
  validates :user_id, uniqueness: true
  validates :name, presence: true
end
