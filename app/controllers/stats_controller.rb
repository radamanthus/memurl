class StatsController < ApplicationController
  def index
    url = Url.where(shortened_url: params[:shorturl]).first
    if url
      # TODO: Put this in a dedicated class
      json_response = {
        url: url.url,
        short_url: url.shortened_url,
        created_at: url.created_at,
        total_hits: url.logs.count
      }.to_json
      render inline: json_response
    else
      @shorturl = params[:shorturl]
      render 'home/404'
    end
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
