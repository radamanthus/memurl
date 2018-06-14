# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Stats", type: :feature do
  scenario "URL visits are logged and collated" do
    u = Url.create(url:'goo.gl')
    3.times do
      visit "/#{u.shortened_url}"
    end

    visit "/stats/#{u.shortened_url}"

    parsed_body = JSON.parse(page.html)
    expect(parsed_body['total_hits']).to equal(3)
  end

end
