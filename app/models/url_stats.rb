# frozen_string_literal: true

# Business logic class for preparing stats for a Url object
#
# Example usage:
#
# u = Url.find_by_short_id('l0ol0')
# UrlStats.for(u)
#
class UrlStats
  def self.for(url)
    total_hits = url.logs.count

    stats = {
      url: url.url,
      short_url: url.shortened_url,
      created_at: url.created_at,
      total_hits: total_hits,
      hits: []
    }

    stats[:hits] = url.logs.map do |l|
      {
        ip: l.remote_ip,
        user_agent: l.user_agent,
        browser: l.browser,
        os: l.os,
        referer: l.referer,
        timestamp: l.created_at
      }
    end

    stats
  end
end
