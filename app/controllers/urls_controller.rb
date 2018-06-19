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
    else
      flash[:error] = 'Please type a valid URL'
      redirect_to root_path
    end
  end
end
