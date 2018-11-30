class Merchant < ApplicationRecord
  validates_presence_of :name
  
  has_many :invoices
  has_many :items 
  has_many :invoice_items, through: :invoices
  has_many :invoice_items, through: :items
  
  default_scope { order(:id)}
  
  def self.most_revenue(quantity)
    unscoped
      .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(items: :invoice_items)
      .group(:id)
      .order("total_revenue DESC")
      .limit(quantity)
  end
  
  def self.most_revenue(quantity)
    unscoped
      .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("total_revenue DESC")
      .limit(quantity)
  end
  
  def self.most_items(quantity)
    unscoped
      .select("merchants.*, sum(invoice_items.quantity) AS total_quantity")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("total_quantity DESC")
      .limit(quantity)
  end
  
  def self.revenue_by_date(date)
    unscoped
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.successful)
      .where(invoices: {created_at: date.to_date.beginning_of_day..date.to_date.end_of_day} )
      .sum("quantity * unit_price")
  end
  
  def self.single_merchant_revenue(id)
    unscoped
      .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.successful)
      .where(id: id)
      .group(:id)
  end
  
  def self.single_merchant_revenue_by_date(params)
    unscoped
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.unscoped.successful)
      .where(invoices: {created_at: params[:date].to_date.beginning_of_day..params[:date].to_date.end_of_day} )
      .where(id: params[:id])
      .sum("quantity * unit_price")
  end
end
