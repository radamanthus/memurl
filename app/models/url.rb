# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :url_logs
  alias_attribute :logs, :url_logs

  before_create :append_default_protocol
  after_create :generate_short_url

  def append_default_protocol
    unless self.url.start_with?(Settings.default_protocol)
      url_with_default_protocol = Settings.default_protocol + "://" + self.url
      self.url = url_with_default_protocol
    end
  end

  def generate_short_url
    shortened_url = UrlShortener.shorten(self.id)
    update_attribute(:shortened_url, shortened_url)
  end
end
