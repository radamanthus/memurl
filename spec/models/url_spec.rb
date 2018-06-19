# frozen_string_literal: true

require 'rails_helper'

describe Url do
  context 'a Url with a non-empty url' do
    let(:url) { create :url, :non_empty_url }
    it 'appends a default protocol to the url field if none was specified' do
      expect(url.url).to include("#{Settings.default_protocol}://")
    end
  end

  context 'a Url with an empty url' do
    let(:url) { build :url, :empty_url }
    it 'is not valid' do
      expect(url.valid?).to be(false)
    end
  end
end
