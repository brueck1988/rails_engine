require 'rails_helper'
RSpec.describe 'Items Destroy API' do
  before :each do
    merchant = create(:merchant)
    @item = create(:item, merchant: merchant)
  end
  
  it 'deletes item that has a merchant associated with it' do
    expect(Item.count).to eq(1)
    
    delete "/api/v1/items/#{@item.id}"
    
    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect(response.status).to eq(200)
  end
end

      
      
      