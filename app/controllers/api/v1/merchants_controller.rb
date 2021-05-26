class API::V1::MerchantsController < ApplicationController  
  def index
    page = [params.fetch(:page, 1).to_i, 1].max
    per_page = params.fetch(:per_page, 20).to_i
    merchants = Merchant.offset((page-1)*per_page).limit(per_page)
    render json: MerchantSerializer.new(merchants)
  end
  
  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant)
  end
end