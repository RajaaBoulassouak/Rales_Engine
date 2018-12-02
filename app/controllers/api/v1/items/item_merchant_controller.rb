class Api::V1::Items::ItemMerchantController < ApplicationController

  def show
    render json: MerchantSerializer.new(Item.find(params[:id]).merchant)
  end
end