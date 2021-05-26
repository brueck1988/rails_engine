class API::V1::ItemsController < ApplicationController  
  def index
    page = [params.fetch(:page, 1).to_i, 1].max
    per_page = params.fetch(:per_page, 20).to_i
    items = Item.offset((page-1)*per_page).limit(per_page)
    render json: ItemSerializer.new(items)
  end
  
  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end
end