class API::V1::MerchantsController < ApplicationController
  
  MERCHANTS_PER_PAGE = 20
  
  def index
    page = params.fetch(:page, 0).to_i
    merchants = Merchant.offset(page*MERCHANTS_PER_PAGE).limit(MERCHANTS_PER_PAGE)
    render json: MerchantSerializer.new(merchants)
  end
  
  def show
    # if Merchant.find_by(id: params[:id])
      merchant = Merchant.find(params[:id])
      render json: MerchantSerializer.new(merchant)
    # else
    #   render json: {error: 'not found'}, status: 404
    # end
  end
end