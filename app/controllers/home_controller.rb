class HomeController < ApplicationController
  def index
    @url = Url.new
  end

  def redirect
    url = Url.where(shortened_url: params[:shorturl]).first
    if url
      redirect_to url.url
    else
      @shorturl = params[:shorturl]
      render '404'
    end
  end
end
