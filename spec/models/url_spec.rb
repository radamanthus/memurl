# frozen_string_literal: true

require 'rails_helper'

describe Url do
  it "appends a default protocol to the url field if none was specified" do
    u = Url.new
    u.url = "google.com"
    u.save
    expect(u.url).to include("#{Settings.default_protocol}://")
  end
end
