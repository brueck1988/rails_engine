require 'rails_helper'

RSpec.describe 'Revenue merchant' do
  before :each do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @merchant_3 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @item_1 = create(:item, merchant: @merchant_1)
    @item_2 = create(:item, merchant: @merchant_2)
    @item_3 = create(:item, merchant: @merchant_3)
    @invoice_1 = create(:invoice, status: 2, customer: @customer_1)
    @invoice_2 = create(:invoice, status: 2, customer: @customer_2)
    @invoice_3 = create(:invoice, status: 2, customer: @customer_3)
    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, unit_price: 5, quantity: 10)
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_2, unit_price: 8, quantity: 10)
    @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_3, unit_price: 2, quantity: 10)
    @transaction_1 = create(:transaction, result: "success", invoice: @invoice_1)
    @transaction_2 = create(:transaction, result: "success", invoice: @invoice_2)
    @transaction_3 = create(:transaction, result: "success", invoice: @invoice_3)
  end
  
  describe 'merchant revenue index' do
    it 'displays a list of merchants sorted by revenue' do
      get "/api/v1/revenue/merchants?quantity=2"
      
      merchants = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(merchants[:data].size).to eq(2)
      expect(merchants[:data].first[:attributes][:revenue]).to eq(80.0)
      expect(merchants[:data].last[:attributes][:revenue]).to eq(50.0)
    end
    
    it 'displays a list of merchants sorted by revenue' do
      get "/api/v1/revenue/merchants?quantity=-1"
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
