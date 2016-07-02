class Source < ApplicationRecord
  has_many :contents, inverse_of: :source, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, uniqueness: { case_sensitive: false }
end
