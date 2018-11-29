class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    revenue = Merchant.revenue_by_date(params[:date])
    render json: {total_revenue: revenue.to_json}
  end
end