class API::V1::MerchantsController < API::APIController
  MERCHANTS_PER_PAGE = 20
  def index
    @page = params.fetch(:page, 0).to_i
    @merchants = Merchant.offset(@page*MERCHANTS_PER_PAGE).limit(MERCHANTS_PER_PAGE)
    render json: MerchantSerializer.new(@merchants)
  end
  
  def show
    require "pry";binding.pry
    @merchant = Merchant
  end
end