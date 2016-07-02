class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :account

  validates :name, presence: true
end
