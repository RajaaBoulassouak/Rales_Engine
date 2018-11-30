class Api::V1::Merchants::RevenueController < ApplicationController
  
  def show 
    if params[:date]
      revenue = Merchant.single_merchant_revenue_by_date(params)
      render json: RevenueSerializer.new(Revenue.new(revenue))
    else
      render json: Revenue::MerchantSerializer.new(Merchant.single_merchant_revenue(params[:id]))
    end
  end
  
  def index
    total_revenue = Merchant.revenue_by_date(params[:date])
    render json: TotalRevenueSerializer.new(TotalRevenue.new(total_revenue))
  end
end