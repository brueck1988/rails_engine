# frozen_string_literal: true

class InvoiceItem < ApplicationRecord
  validates_presence_of :quantity
  validates_presence_of :unit_price

  belongs_to :item
  belongs_to :invoice
  has_one :merchant, through: :item
end
