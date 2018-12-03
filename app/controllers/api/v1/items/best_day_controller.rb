class Api::V1::Items::BestDayController < ApplicationController
  
  def show
    best_day = Item.best_day(params[:id])
    render json: DaySerializer.new(Day.new(best_day))
  end   
end 