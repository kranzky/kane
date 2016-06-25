class Content < ApplicationRecord
  has_many :posts, inverse_of: :content, dependent: :restrict_with_exception
  belongs_to :provider, inverse_of: :contents, counter_cache: true

  validates :url, presence: true, uniqueness: true
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
    # Provider.find_or_create
#   results.first.authors url/name
#   results.first.favicon_url
#   results.first.provider_name
#   results.first.provider_url
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
