class ExtractContentJob < ApplicationJob
  queue_as :default

  def perform(post)
    return if post.content.present?
    post.content = Content.find_by(url: post.url)
    if post.content.present?
      post.save
      return
    end
    embedly = Embedly::API.new(key: Rails.application.secrets.embedly_api_key)
    results = embedly.extract(url: post.url).first
    authors =
      results.authors.map do |author|
        Author.find_or_create_by(name: author['name']) do |object|
          object.url = author['url']
        end
      end
    source =
      Source.find_or_create_by(url: results.provider_url) do |object|
        object.name = results.provider_name
        object.favicon = results.favicon_url
      end
    post.content =
      Content.create!(
        source: source,
        authors: authors,
        url: results.url,
        title: results.title,
        description: results.description,
        body: results.content,
        thumbnail: results.images.first['url'],
        language: results.language,
        tags: results.keywords.map { |keyword| keyword["name"] },
        published_at: results.published
      )
    post.save
  end
end
