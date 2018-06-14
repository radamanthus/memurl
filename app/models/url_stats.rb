# frozen_string_literal: true

class UrlStats
  def self.for(url)
    total_hits = url.logs.count

    stats = {
      url: url.url,
      short_url: url.shortened_url,
      created_at: url.created_at,
      total_hits: total_hits,
      browser_stats: {},
      os_stats: {}
    }

    stats
  end
end
