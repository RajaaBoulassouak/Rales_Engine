class Api::V1::Items::MostRevenueController < ApplicationController
  
  def index
    render json: TotalRevenue::ItemSerializer.new(Item.most_revenue(params[:quantity]))
  end   
end 