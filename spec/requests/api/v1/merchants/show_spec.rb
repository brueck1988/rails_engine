require 'rails_helper'
RSpec.describe 'Merchant API' do
  before :each do
    @merchant = create(:merchant)
  end

  it 'happy path, fetch one merchant by id' do
    get "/api/v1/merchants/#{@merchant.id}"
    merchant = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(response).to be_successful
    expect(merchant).to have_key(:id)
    expect(merchant).to have_key(:attributes)
    expect(merchant[:attributes]).to have_key(:name)
    expect(merchant[:attributes][:name]).to be_a(String)
    expect(response.status).to eq(200)
  end

  it 'sad path, bad integer id returns 404' do
    get '/api/v1/merchants/9000'
    
    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end
end


      