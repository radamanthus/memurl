class UrlShortener
  HASHID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

  # This gives a maximum of 60M unique short URLs
  # but short URLs are easier to type and pass around
  def self.shorten(id)
    hashid = Hashids.new(Settings.hash_id_salt, 5, HASHID_ALPHABET)
    hashid.encode(id)
  end
end
