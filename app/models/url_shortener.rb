# frozen_string_literal: true

# Business logic class for preparing a unique short URL for an url record
#
# We use the Hashid gem to generate a hashcode from the url ID
#
# We use smallcase letters and numbers only.
# This gives a maximum of 60M unique short URLs
# but short URLs are easier to type and pass around.
#
class UrlShortener
  HASHID_ALPHABET = ('a'..'z').to_a.join + ('0'..'9').to_a.join

  def self.shorten(id)
    hashid = Hashids.new(Settings.hash_id_salt, 5, HASHID_ALPHABET)
    hashid.encode(id)
  end
end
