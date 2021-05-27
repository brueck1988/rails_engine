class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.total_revenue(merchant_quantity)
    joins(:transactions)
    .select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue')
    .where('transactions.result = ?', 'success')
    .group(:id)
    .order(revenue: :desc)
    .limit(merchant_quantity)
  end
end
