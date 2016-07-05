class Content < ApplicationRecord
  belongs_to :source, inverse_of: :contents, counter_cache: true
  has_many :posts, inverse_of: :content, dependent: :restrict_with_exception
  has_and_belongs_to_many :authors, inverse_of: :contents

  validates :source, presence: true
  validates :source_id, uniqueness: true
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true

  enum access: {
    native: 'native',
    external: 'external',
    premium: 'premium',
    banned: 'banned'
  }, _prefix: true
end
