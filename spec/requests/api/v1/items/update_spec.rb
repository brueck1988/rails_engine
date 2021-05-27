require 'rails_helper'
RSpec.describe 'Items Update API' do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant: merchant)
  end
  
  it 'updates item that has a merchant associated with it' do
    expect(Item.count).to eq(1)

    original_description = @item.description
    new_description = {description: "Poodles745"}
    content_type = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/items/#{@item.id}", headers: content_type, params: JSON.generate(item: new_description)

    updated_item = Item.find(@item.id)
  
    expect(response).to be_successful
    expect(Item.count).to eq(1)
    expect(response.status).to eq(200)
    expect(updated_item.description).to eq("Poodles745")
  end
  
  it 'updates item that incorrect merchant id' do
    expect(Item.count).to eq(1)

    original_description = @item.description
    new_merchant_id = {merchant_id: 8373838}
    content_type = {"CONTENT_TYPE" => "application/json"}
  
    patch "/api/v1/items/#{@item.id}", headers: content_type, params: JSON.generate(item: new_merchant_id)

    expect(response.status).to eq(400)
  end
end

      
      
      