class HomeController < ApplicationController
  def index
    @url = Url.new
  end

  def redirect
    url = Url.where(shortened_url: params[:shorturl]).first
    if url
      url.logs.create(
        remote_ip: request.remote_ip,
        user_agent: request.headers['HTTP_USER_AGENT'],
        referer: request.referer
      )
      redirect_to url.url
    else
      @shorturl = params[:shorturl]
      render '404'
    end
  end
end
