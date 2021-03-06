class Api::V1::Items::ItemInvoiceItemsController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(Item.find(params[:id]).invoice_items)
  end
end