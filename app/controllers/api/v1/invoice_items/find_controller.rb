class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(invoice_items_params))
  end
  
  private 
  def invoice_items_params
    params[:unit_price] = (params[:unit_price].to_f * 100).round(2) if params[:unit_price]
    params.permit(:id, 
                  :item_id, 
                  :invoice_id, 
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at )
  end
end