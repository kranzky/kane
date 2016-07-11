class HomeController < ApplicationController
  include CloudinaryHelper

  def index
    @post = Post.includes(:content, :user)
      .where.not(contents: { id: nil })
      .random
    @content = @post.content
    @thumbnail_empty = _cloudinary("empty.png", "3:1")
    @thumbnail = _cloudinary(@content.thumbnail, "3:1")
    @favicon_empty = _cloudinary("empty.png", "1:1")
    @favicon = _cloudinary(@content.source.favicon, "1:1")
    @avatar_empty = _cloudinary("empty.png", "1:1")
    @avatar = _cloudinary_twitter(@post.user.name, "1:1")
    @published = @content.published_at || @content.created_at
  end

  protected

  def _cloudinary_twitter(name, ratio = nil)
    _cloudinary("#{name}.jpg", "1:1", true)
  end

  def _cloudinary(name, ratio = nil, twitter=false)
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
