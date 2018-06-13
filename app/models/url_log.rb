require 'useragent'

class UrlLog < ApplicationRecord
  belongs_to :url

  before_save :parse_user_agent

  def parse_user_agent
    ua = UserAgent.parse(self.user_agent)
    self.browser = ua.browser
    self.os = ua.platform
  end
end
