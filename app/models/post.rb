class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts, counter_cache: true
  belongs_to :content, inverse_of: :posts, optional: true, counter_cache: true
  has_many :statistics, inverse_of: :post, dependent: :restrict_with_exception

  validates :user, presence: true
  validates :user_id, uniqueness: true
  validates :content_id, uniqueness: true
  validates :url, presence: true
end
