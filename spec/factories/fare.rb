FactoryBot.define do
  factory :fare do
    city

    kind :business
    pickup 250
    per_minute 20
    per_km 20
    minimum_price 500
  end
end
