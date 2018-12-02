class Api::V1::InvoiceItems::InvoiceItemInvoiceController < ApplicationController

  def show
    render json: InvoiceSerializer.new(InvoiceItem.find(params[:id]).invoice)
  end
end