class Content < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :body, presence: true

  enum access: {
    native: 'native',
    external: 'external',
    premium: 'premium',
    banned: 'banned'
  }, _prefix: true
end
