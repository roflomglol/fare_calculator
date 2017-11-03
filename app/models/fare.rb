class Fare < ApplicationRecord
  enum kind: [ :business, :vip, :luxe, :plus, :kids, :designated_driver ]

  validates :kind,          presence: true, uniqueness: { scope: :city }
  validates :pickup,        presence: true
  validates :per_minute,    presence: true
  validates :per_km,        presence: true
  validates :minimum_price, presence: true

  belongs_to :city
end
