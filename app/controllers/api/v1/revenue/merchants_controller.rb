# frozen_string_literal: true

module API
  module V1
    module Revenue
      class MerchantsController < ApplicationController
        def index
          quantity = params.fetch(:quantity).to_i
          merchants = Merchant.total_revenue(params[:quantity])
          render json: MerchantNameRevenueSerializer.new(merchants)
        end
      end
    end
  end
end
