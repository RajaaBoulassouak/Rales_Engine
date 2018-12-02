class Api::V1::Invoices::InvoiceInvoiceItemsController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(Invoice.find(params[:id]).invoice_items)
  end
end