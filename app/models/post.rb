class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts, required: true, counter_cache: true
  belongs_to :content, inverse_of: :posts, required: false, counter_cache: true
  has_many :statistics, inverse_of: :post, dependent: :restrict_with_exception

  validates :url, presence: true
end
