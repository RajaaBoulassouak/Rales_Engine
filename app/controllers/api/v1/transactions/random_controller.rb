class Api::V1::Transactions::RandomController < ApplicationController
  
  def show 
    render json: TransactionSerializer.new(Transaction.all.sample(1))
  end   
end 