class User < ApplicationRecord
  has_one :account, inverse_of: :user, required: true, dependent: :restrict_with_exception
  has_one :profile, inverse_of: :user, required: true, dependent: :restrict_with_exception
  has_many :posts, inverse_of: :user, dependent: :restrict_with_exception
  has_many :statistics, inverse_of: :user, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
