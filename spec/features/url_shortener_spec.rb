require 'rails_helper'

RSpec.feature "URL shortening", type: :feature do
  scenario "User submits a new URL" do
    visit "/"
    fill_in "url_url", with: "http://www.google.com"
    click_button "create_url"

    expect(page).to have_text "Shortened URL"
    expect(page).to have_content("http://", count: 2)
  end

end

RSpec.describe "short URL redirect", type: :request do
  it "redirects a shortened URL to the full URL" do
    url = Url.create(url: "http://goo.gl", shortened_url:"ABCDE")

    get "/#{url.shortened_url}"
    expect(response).to redirect_to(url.url)
  end
end
