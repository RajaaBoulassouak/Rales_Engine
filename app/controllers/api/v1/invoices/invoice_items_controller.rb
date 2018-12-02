class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def show
    render json: ItemSerializer.new(Invoice.find(params[:id]).items)
  end
end