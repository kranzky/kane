class HomeController < ApplicationController
  include CloudinaryHelper

  def index
    @content = Content.random
    @thumbnail_empty = _cloudinary("empty.png", "3:1")
    @thumbnail = _cloudinary(@content.thumbnail, "3:1")
  end

  protected

  def _cloudinary(name, ratio = nil)
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
    link = cl_image_tag(name, client_hints: true, transformation: transformation)
    link.match(/<img src="([^"]*?)"/)[1]
  end
end
