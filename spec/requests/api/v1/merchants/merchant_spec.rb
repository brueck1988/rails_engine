require 'rails_helper'
RSpec.describe 'Merchants API' do
  before :each do
    create_list(:merchant, 100)
  end
  
  describe 'sends a list of merchants' do
    it 'if page number is not provided' do
      get '/api/v1/merchants'
      merchants = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(merchants.count).to eq(20)
      get '/api/v1/merchants?page=0'
      page_0_merchants = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(merchants.count).to eq(20)
      
      expect(merchants).to eq(page_0_merchants)
    end

    it 'if page number = 1 is provided' do
      get '/api/v1/merchants?page=1'
      
      merchants = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(merchants.count).to eq(20)
      
      merchants.each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  
    it 'if page number = 2 is provided' do
      get '/api/v1/merchants?page=2'
      
      merchants = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      expect(merchants.count).to eq(20)
    end
  end
  
  describe 'does not send a list of merchants' do  
    it 'if page number exceeds database' do
      get '/api/v1/merchants?page=6'
      
      merchants = JSON.parse(response.body, symbolize_names: true)[:data]
      require "pry";binding.pry
      expect(response).to be_unsuccessful
      expect(merchants.count).to eq(20)
    end
  end
end

# RSpec.describe 'Merchant API' do
#   describe 'can get merchant attributes' do
#     it 'can get details for a merchant' do      
#       get "api/v1/merchants"
# 
#       expect(response).to be_successful
#       expect(response.status).to eq(200)
#       expect(response.content_type).to eq("application/json")
# 
#       shroeder_jerde = Merchant.last
# 
#       merchant = JSON.parse(response.body, symbolize_names: true)
# 
#       expect(merchant).to be_a(Hash)
#       expect(merchant).to have_key(:data)
#       expect(merchant[:data]).to be_a(Hash)
#       expect(merchant[:data]).to have_key(:attributes)
#       expect(merchant[:data][:attributes]).to be_a(Hash)
# 
#       merchant_attributes = merchant[:data][:attributes]
#       expect(merchant_attributes).to have_key(:name)
#       expect(merchant_attributes[:name]).to be_a(String)
#       expect(merchant_attributes[:name]).to eq(shroeder_jerde.name)
#     end
    
    # it 'can get details for a merchant' do
    #   query_params = {name: "Schroeder-Jerde"}
    # 
    #   get "api/v1/merchants", params: query_params
    # 
    #   expect(response).to be_successful
    #   expect(response.status).to eq(200)
    #   expect(response.content_type).to eq("application/json")
    # 
    #   shroeder_jerde = Merchant.last
    # 
    #   merchant = JSON.parse(response.body, symbolize_names: true)
    # 
    #   expect(merchant).to be_a(Hash)
    #   expect(merchant).to have_key(:data)
    #   expect(merchant[:data]).to be_a(Hash)
    #   expect(merchant[:data]).to have_key(:attributes)
    #   expect(merchant[:data][:attributes]).to be_a(Hash)
    # 
    #   merchant_attributes = merchant[:data][:attributes]
    #   expect(merchant_attributes).to have_key(:name)
    #   expect(merchant_attributes[:name]).to be_a(String)
    #   expect(merchant_attributes[:name]).to eq(shroeder_jerde.name)
    # end
#   end
# end
      
      
      