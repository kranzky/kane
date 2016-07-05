class Author < ApplicationRecord
  has_and_belongs_to_many :contents, inverse_of: :authors

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, uniqueness: { case_sensitive: false }
end
