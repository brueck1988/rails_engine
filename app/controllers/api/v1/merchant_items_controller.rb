# frozen_string_literal: true

module API
  module V1
    class MerchantItemsController < ApplicationController
      def index
        merchant = Merchant.find(params[:merchant_id])
        render json: ItemSerializer.new(merchant.items)
      end
    end
  end
end
