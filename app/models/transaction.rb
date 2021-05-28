# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :customers, through: :invoice

  enum result: %i[failed success]
end
