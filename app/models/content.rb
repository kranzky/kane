class Content < ApplicationRecord
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

#   results.first.authors url/name

#   results.first.favicon_url
#   results.first.provider_name
#   results.first.provider_url
  end
end
