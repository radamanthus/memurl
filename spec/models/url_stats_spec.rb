# frozen_string_literal: true

require 'rails_helper'

describe UrlStats do
  it 'calculates total hits for a url' do
    u = Url.create(url: 'google.com')
    5.times { u.logs.create }

    stats = UrlStats.for(u)
    expect(stats[:total_hits]).to equal(5)
  end
end
