class Author < ApplicationRecord
  has_and_belongs_to_many :contents, inverse_of: :authors

  validates :name, presence: true
end
