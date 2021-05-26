require 'rails_helper'
RSpec.describe 'Merchant Items API' do
  before :each do
    @merchant = create(:merchant)
    create_list(:item, 6, merchant: @merchant)
  end
  
  it 'happy path, fetch all items' do
    get "/api/v1/merchants/#{@merchant.id}/items"
    merchant_items = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(merchant_items[:data].count).to eq(6)
  end
  
  it 'sad path, bad integer id returns 404' do
    get "/api/v1/merchants/9000/items"
    
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end
