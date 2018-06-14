# frozen_string_literal: true

class UrlsController < ApplicationController
  def show
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new
    @url.url = params[:url][:url]
    if @url.save
      redirect_to url_path(@url)
    end
  end
end
