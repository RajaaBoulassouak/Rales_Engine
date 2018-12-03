class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant
  has_many :invoice_items
  
  default_scope { order(:id)}
  
  def self.most_revenue(quantity)
    unscoped
      .select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items)
      .group(:id)
      .order("total_revenue DESC")
      .limit(quantity)
  end
  
  def self.most_items(quantity)
    unscoped
      .select("items.*, sum(invoice_items.quantity) AS total_items")
      .joins(:invoice_items)
      .group(:id)
      .order("total_items DESC")
      .limit(quantity)
  end
  
  def self.best_day(id)
    Invoice.unscoped.select("invoices.*, sum(invoice_items.quantity) AS total_sales")
    .joins(:invoice_items)
    .where(invoice_items: {item_id: id} )
    .group(:id)
    .order("total_sales DESC")
    .limit(1)
    .first
    .created_at
  end
end
