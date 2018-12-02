class Revenue::MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  attribute :total_revenue do |object|
    (object.total_revenue.round(2)/100.00).to_s
  end
end