# frozen_string_literal: true

module API
  module V1
    class ItemsMerchantController < ApplicationController
      def index
        item = Item.find(params[:item_id])
        render json: MerchantSerializer.new(item.merchant)
      end
    end
  end
end
