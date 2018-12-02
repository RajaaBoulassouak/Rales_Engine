class Api::V1::Merchants::MerchantItemsController < ApplicationController

  def show
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end
end