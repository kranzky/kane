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
    post.content = Content.find_by(url: results.url)
    if post.content.present?
      post.save
      return
    end
    authors =
      results.authors.map do |author|
        Author.find_or_create_by(name: author['name']) do |object|
          object.url = author['url']
        end
      end
    source =
      Source.find_or_create_by(url: results.provider_url) do |object|
        object.name = results.provider_name
        object.favicon = _upload(results.favicon_url)
      end
    thumbnail = nil
    content = results.content
    keywords = results.keywords.map { |keyword| keyword["name"] }
    results.images.each do |image|
      if content =~ /#{image['url']}/
        name = _upload(image['url'])
        content.gsub!(/#{image['url']}/, "__CLOUDINARY(#{name})__") 
      else
        next if image['width'] < 200 || image['height'] < 200
        next if thumbnail.present? && thumbnail['width'] > image['width']
        thumbnail = image
      end
    end
    if thumbnail.nil?
      thumbnail = _upload(_flickr(keywords))
    else
      thumbnail = _upload(thumbnail['url'])
    end
    post.content =
      Content.create!(
        source: source,
        authors: authors,
        url: results.url,
        title: results.title,
        description: results.description,
        body: content,
        thumbnail: thumbnail,
        language: results.language,
        tags: keywords,
        published_at: results.published
      )
    post.save
  end

  protected

  def _upload(url)
    results = Cloudinary::Uploader.upload(url)
    "#{results['public_id']}.#{results['format']}"
  end

  def _flickr(keywords)
    results =
      flickr.photos.search({
        tags: keywords,
        license: "9,10",
        sort: 'interestingness-desc',
        content_type: 1,
        media: 'photos',
        per_page: 1
      }).first
    "https://farm#{results['farm']}.staticflickr.com/#{results['server']}/#{results['id']}_#{results['secret']}_b.jpg"
  end
end
