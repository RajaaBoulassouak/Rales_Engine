class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  
  default_scope { order(:id)}
  
  def self.favorite_merchant(id)
    Merchant.unscoped.select("merchants.*, COUNT(invoices.id) AS invoice_total")
      .joins(:invoices)
      .where(invoices: { customer_id: id })
      .group(:id)
      .order("invoice_total DESC")
      .first
  end
end
