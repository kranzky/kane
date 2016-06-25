class User < ApplicationRecord
  has_one :account, inverse_of: :user, required: true, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
