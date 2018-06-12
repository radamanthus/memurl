require 'rails_helper'

RSpec.feature "URL shortening", type: :feature do
  scenario "User submits a new URL" do
    visit "/"
    fill_in "URL", with: "http://www.google.com"
    click_button "Create Short URL"

    expect(page).to have_text "Shortened URL:"
  end
end
