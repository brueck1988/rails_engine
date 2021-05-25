class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end

# has_many :books
# 
# attribute :num_books do |object|
#   object.books.count
# end