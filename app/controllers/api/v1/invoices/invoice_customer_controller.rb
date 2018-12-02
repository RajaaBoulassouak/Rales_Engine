class Api::V1::Invoices::InvoiceCustomerController < ApplicationController

  def show
    render json: CustomerSerializer.new(Invoice.find(params[:id]).customer)
  end
end