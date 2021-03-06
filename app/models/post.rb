class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts, counter_cache: true
  belongs_to :content, inverse_of: :posts, optional: true, counter_cache: true
  has_many :statistics, inverse_of: :post, dependent: :restrict_with_exception

  validates :user, presence: true
  validates :url, presence: true

  after_save :_extract_content

  protected

  def _extract_content
    ExtractContentJob.perform_later(self)
  end
end
