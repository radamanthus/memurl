# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    url = Url.where(shortened_url: params[:shorturl]).first
    if url
      render inline: UrlStats.for(url).to_json
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
