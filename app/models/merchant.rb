class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :invoices
  has_many :items 
  has_many :invoice_items, through: :invoices
  has_many :invoice_items, through: :items
  
  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(items: :invoice_items)
    .order("total_revenue DESC")
    .limit(quantity)
  end
end
