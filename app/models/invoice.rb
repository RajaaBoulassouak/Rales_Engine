class Invoice < ApplicationRecord
  validates_presence_of :status
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  
  default_scope { order(:id)}
  
  
  # def most_expensive_invoices(quantity)
    # Invoice.select("invoices.*, SUM(invoice_items.unit_price*invoice_items.quantity) AS revenue").joins(:transactions, :invoice_items).where(transactions: {result: "success"}).group(:id).order("revenue DESC").limit(quantity)
    
    # Invoice.select("invoices.*, SUM(invoice_items.unit_price*invoice_items.quantity) AS revenue").joins(:transactions, :invoice_items).merge(Transaction.successful).group(:id).order("revenue DESC").limit(quantity)
  
  
    # Invoice.select("invoices.*, SUM(invoice_items.unit_price*invoice_items.quantity) AS revenue").joins(:transactions).joins(:invoice_items).where("transactions.result = ?", "success").group(:id).order("revenue DESC").limit(quantity)
  # end
end
