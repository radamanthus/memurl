# frozen_string_literal: true

require 'rails_helper'

describe UrlLog do
  # The test string is from the example in https://github.com/gshutler/useragent
  it 'parses the user_agent field to populate the browser and the os fields' do
    url = Url.create(url: 'goo.gl')
    l = url.logs.new
    l.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5'
    l.save
    expect(l.browser).to eq('Chrome')
    expect(l.os).to eq('Macintosh')
  end
end
