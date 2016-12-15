class HomeController < ApplicationController
  include CloudinaryHelper

  def index
    @post = Post.includes(:content, :user)
      .where.not(content_id: nil)
      .order(updated_at: :desc)
      .first
    @content = @post.content
    @thumbnail_empty = _cloudinary("empty.png", "3:1")
    @thumbnail = _cloudinary(@content.thumbnail, "3:1")
    @favicon_empty = _cloudinary("empty.png", "1:1")
    @favicon = _cloudinary(@content.source.favicon, "1:1")
    @avatar_empty = _cloudinary("empty.png", "1:1")
    @avatar = _cloudinary_twitter(@post.user.name, "1:1")
    @published = [@content.published_at, @post.posted_at].compact.min 
  end

  protected

  def _cloudinary_twitter(name, ratio = nil)
    name = name.nil? ? "empty.png" : "#{name}.jpg"
    _cloudinary(name, "1:1", true)
  end

  def _cloudinary(name, ratio = nil, twitter=false)
    name ||= "empty.png"
    transformation = [
      {
        gravity: "auto",
        crop: "fill"
      },
      {
        width: "auto",
        quality: "auto",
        fetch_format: "auto",
        dpr: "auto"
      },
      {
        width: 1200,
        crop: "limit"
      }
    ]
    if ratio.present?
      transformation[0][:aspect_ratio] = ratio
    end
    link =
      if twitter
        twitter_name_profile_image_tag(name, client_hints: true, transformation: transformation)
      else
        cl_image_tag(name, client_hints: true, transformation: transformation)
      end
    link.match(/<img src="([^"]*?)"/)[1]
  end
end
