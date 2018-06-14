# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'URL shortening', type: :feature do
  scenario 'User submits a new URL' do
    visit '/'
    fill_in 'url_url', with: 'http://www.google.com'
    click_button 'create_url'

    expect(page).to have_text 'Shortened URL'
    expect(page).to have_content('http://', count: 2)
  end
end
