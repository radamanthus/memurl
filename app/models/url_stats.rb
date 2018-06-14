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
      browser_stats: {},
      os_stats: {}
    }

    stats
  end
end
