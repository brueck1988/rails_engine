# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Item Show API' do
  before :each do
    @item = create(:item)
  end

  it 'happy path, fetch one item by id' do
    get "/api/v1/items/#{@item.id}"
    item = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful
    expect(item).to have_key(:id)
    expect(item).to have_key(:attributes)
    expect(item[:attributes]).to have_key(:name)
    expect(item[:attributes][:name]).to be_a(String)
    expect(response.status).to eq(200)
  end

  it 'sad path, bad integer id returns 404' do
    get '/api/v1/items/9000'

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end
