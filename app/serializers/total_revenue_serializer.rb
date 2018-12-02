class TotalRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :total_revenue do |object|
    (object.total_revenue.round(2)/100.00).to_s
  end
end
