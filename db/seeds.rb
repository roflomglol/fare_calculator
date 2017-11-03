city = City.find_or_create_by(name: 'Moscow')

fares = {
  business: {
    pickup: 250,
    per_minute: 20,
    per_km: 20,
    minimum_price: 500
  },
  vip: {
    pickup: 500,
    per_minute: 40,
    per_km: 40,
    minimum_price: 1000
  },
  luxe: {
    pickup: 450,
    per_minute: 32,
    per_km: 80,
    minimum_price: 2000
  },
  plus: {
    pickup: 375,
    per_minute: 30,
    per_km: 30,
    minimum_price: 2500
  },
  kids: {
    pickup: 450,
    per_minute: 20,
    per_km: 20,
    minimum_price: 700
  },
  designated_driver: {
    pickup: 300,
    per_minute: 30,
    per_km: 75,
    minimum_price: 2000
  }
}

fares.each do |kind, params|
  Fare.create_with(params.merge(city: city)).find_or_create_by(kind: kind)
end
