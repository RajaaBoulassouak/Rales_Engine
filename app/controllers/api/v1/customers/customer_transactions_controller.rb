class Api::V1::Customers::CustomerTransactionsController < ApplicationController

  def show
    render json: TransactionSerializer.new(Customer.find(params[:id]).transactions)
  end
end