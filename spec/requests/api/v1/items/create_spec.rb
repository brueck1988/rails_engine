require 'rails_helper'
RSpec.describe 'Items Create API' do  
  before :each do
    @merchant = create(:merchant)
  end 
  
  it 'creates item that has a merchant associated with it' do
    expect(Item.count).to eq(0)
    item_params = {
                   name: "Liberica",
                   description: "Organic pickled intelligentsia coffee.",
                   unit_price: 70.23,
                   merchant_id: @merchant.id
                 }       
    headers = {'CONTENT_TYPE' => 'application/json'}
    
    post '/api/v1/items', headers: headers, params: JSON.generate(item: item_params)
    
    item = Item.last
    
    expect(response).to be_successful
    expect(Item.count).to eq(1)
    expect(response.status).to eq(201)
    
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.unit_price).to eq(item_params[:unit_price])
    expect(item.merchant_id).to eq(item_params[:merchant_id])
  end
end