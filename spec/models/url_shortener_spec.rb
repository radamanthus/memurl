# frozen_string_literal: true

require 'rails_helper'

describe UrlShortener do
  it 'produces a non-empty hashcode given when given an url ID' do
    expect(UrlShortener.shorten(1).length).to be > 0
  end
end
