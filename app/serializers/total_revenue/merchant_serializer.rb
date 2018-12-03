class TotalRevenue::MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, 
             :name
             
  attribute :total_revenue do |merchant|
    (merchant.total_revenue.round(2)/100.00).to_s
  end
end