# frozen_string_literal: true

class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
end

# has_many :books
#
# attribute :num_books do |object|
#   object.books.count
# end
