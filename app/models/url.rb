class Url < ApplicationRecord
  after_create :generate_short_url

  def generate_short_url
    shortened_url = UrlShortener.shorten(self.id)
    update_attribute(:shortened_url, shortened_url)
  end
end
