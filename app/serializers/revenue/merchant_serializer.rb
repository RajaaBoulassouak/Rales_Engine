class Revenue::MerchantSerializer
  include FastJsonapi::ObjectSerializer
             
  attribute :revenue do |merchant|
    (merchant.total_revenue.round(2)/100.00).to_s
  end
end