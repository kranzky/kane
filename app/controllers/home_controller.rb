class HomeController < ApplicationController
  def index
    @content = Content.random
  end
end
