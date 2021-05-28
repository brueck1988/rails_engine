# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Item Merchants API' do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant: merchant)
  end

  it 'happy path, fetch all merchants' do
    get "/api/v1/items/#{@item.id}/merchant"

    item_merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item_merchants[:data]).to be_a(Hash)
  end

  it 'sad path, bad integer id returns 404' do
    get '/api/v1/items/9000/merchant'

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end
