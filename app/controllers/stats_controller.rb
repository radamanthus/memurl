# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    url = Url.where(shortened_url: params[:shorturl]).first
    if url
      render json: UrlStats.for(url).to_json
    else
      @shorturl = params[:shorturl]
      render 'home/404'
    end
  end
end
