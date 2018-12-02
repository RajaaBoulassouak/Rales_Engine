class Api::V1::Merchants::MerchantInvoicesController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Merchant.find(params[:id]).invoices)
  end
end