class Api::V1::Invoices::RandomController < ApplicationController
  
  def show 
    render json: InvoiceSerializer.new(Invoice.all.sample(1))
  end   
end 