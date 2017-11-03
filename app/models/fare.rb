class Fare < ApplicationRecord
  enum kind: [ :business, :vip, :luxe, :plus, :kids, :designated_driver ]

  validates :kind,          presence: true
  validates :pickup,        presence: true
  validates :per_minute,    presence: true
  validates :per_km,        presence: true
  validates :minimum_price, presence: true
end
