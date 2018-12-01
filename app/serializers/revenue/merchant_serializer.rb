class Revenue::MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :total_revenue
end