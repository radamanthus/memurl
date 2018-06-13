require 'rails_helper'

RSpec.describe "HomeController", type: :request do
  it "redirects a shortened URL to the full URL" do
    url = Url.create(url: "http://goo.gl", shortened_url:"ABCDE")

    get "/#{url.shortened_url}"
    expect(response).to redirect_to(url.url)
    expect(url.logs.length).to be > 0
  end
end
