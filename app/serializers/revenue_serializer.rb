class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
    (object.revenue.round(2)/100.00).to_s
  end
end
