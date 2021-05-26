require 'rails_helper'
RSpec.describe 'Items Index API' do
  before :each do
    create_list(:item, 100)
  end
  
  describe 'sends a list of items' do
    it 'if page number is not provided' do
      get '/api/v1/items'
      items = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(items.count).to eq(20)
      get '/api/v1/items?page=0'
      page_0_items = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(items.count).to eq(20)
      
      expect(items).to eq(page_0_items)
    end

    it 'if page number = 1 is provided' do
      get '/api/v1/items?page=1'
      
      items = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(items.count).to eq(20)
      
      items.each do |item|
        expect(item).to have_key(:id)
        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
      end
    end
  
    it 'if page number = 2 is provided' do
      get '/api/v1/items?page=2'
      
      items = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(items.count).to eq(20)
    end
  end
  
  describe 'does not send a list of items' do  
    it 'if page number exceeds database' do
      get '/api/v1/items?page=6'
      
      items = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(items.count).to eq(0)
    end
  end
end

# RSpec.describe 'Merchant API' do
#   describe 'can get item attributes' do
#     it 'can get details for a item' do      
#       get "api/v1/items"
# 
#       expect(response).to be_successful
#       expect(response.status).to eq(200)
#       expect(response.content_type).to eq("application/json")
# 
#       shroeder_jerde = Merchant.last
# 
#       item = JSON.parse(response.body, symbolize_names: true)
# 
#       expect(item).to be_a(Hash)
#       expect(item).to have_key(:data)
#       expect(item[:data]).to be_a(Hash)
#       expect(item[:data]).to have_key(:attributes)
#       expect(item[:data][:attributes]).to be_a(Hash)
# 
#       item_attributes = item[:data][:attributes]
#       expect(item_attributes).to have_key(:name)
#       expect(item_attributes[:name]).to be_a(String)
#       expect(item_attributes[:name]).to eq(shroeder_jerde.name)
#     end
    
    # it 'can get details for a item' do
    #   query_params = {name: "Schroeder-Jerde"}
    # 
    #   get "api/v1/items", params: query_params
    # 
    #   expect(response).to be_successful
    #   expect(response.status).to eq(200)
    #   expect(response.content_type).to eq("application/json")
    # 
    #   shroeder_jerde = Merchant.last
    # 
    #   item = JSON.parse(response.body, symbolize_names: true)
    # 
    #   expect(item).to be_a(Hash)
    #   expect(item).to have_key(:data)
    #   expect(item[:data]).to be_a(Hash)
    #   expect(item[:data]).to have_key(:attributes)
    #   expect(item[:data][:attributes]).to be_a(Hash)
    # 
    #   item_attributes = item[:data][:attributes]
    #   expect(item_attributes).to have_key(:name)
    #   expect(item_attributes[:name]).to be_a(String)
    #   expect(item_attributes[:name]).to eq(shroeder_jerde.name)
    # end
#   end
# end
      
      
      