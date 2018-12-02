class Api::V1::Invoices::InvoiceTransactionsController < ApplicationController

  def show
    render json: TransactionSerializer.new(Invoice.find(params[:id]).transactions)
  end
end