# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :url_logs
  alias_attribute :logs, :url_logs

  before_create :append_default_protocol
  after_create :generate_short_url

  def append_default_protocol
    unless url.start_with?('http')
      self.url = Settings.default_protocol + '://' + url
    end
  end

  def generate_short_url
    shortened_url = UrlShortener.shorten(id)
    update_attribute(:shortened_url, shortened_url)
  end
end
