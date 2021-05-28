# frozen_string_literal: true

module API
  module V1
    module Revenue
      class MerchantsController < ApplicationController
        def index
          # return bad_params_400("Invalid params") if params[:quantity].to_i == 0 || !params[:quantity].present?
          page = [params.fetch(:page, 1).to_i, 1].max
          quantity = params.fetch(:quantity, 20).to_i
          # merchants = Merchant.offset((page-1)*per_page).limit(per_page)
          @merchants = Merchant.total_revenue(params[:quantity])
          render json: MerchantSerializer.new(@merchants)
          # render json: MerchantSerializer.new(merchants)
        end
        #
        # def show
        #   # merchant = Merchant.find(params[:id])
        #   # render json: MerchantSerializer.new(merchant)
        # end
      end
    end
  end
end
