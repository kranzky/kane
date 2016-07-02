class Content < ApplicationRecord
  belongs_to :source, inverse_of: :contents, required: true, counter_cache: true
  has_many :posts, inverse_of: :content, dependent: :restrict_with_exception
  has_and_belongs_to_many :authors, inverse_of: :contents

  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true

  enum access: {
    native: 'native',
    external: 'external',
    premium: 'premium',
    banned: 'banned'
  }, _prefix: true

  def self.extract!(url)
    embedly = Embedly::API.new(key: Rails.application.secrets.embedly_api_key)
    results = embedly.extract(url: url).first
    # Author.find_or_create
    # Source.find_or_create
#   results.first.authors url/name
#   results.first.favicon_url
#   results.first.source_name
#   results.first.source_url
    Content.create!(
      url: results.url,
      title: results.title,
      description: results.description,
      body: results.content,
      thumbnail: results.images.first['url'],
      language: results.language,
      tags: results.keywords.map { |keyword| keyword["name"] },
      published_at: results.published
    )
  end
end
