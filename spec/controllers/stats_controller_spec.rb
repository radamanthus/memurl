# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'StatsController', type: :request do
  it 'renders the 404 page if an invalid short URL was given', type: :request do
    get "/stats/ABCDE"
    expect(response).to render_template("home/404")
  end
end
