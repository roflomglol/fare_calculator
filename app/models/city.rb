class City < ApplicationRecord
  validates :name, presence: true

  has_many :fares
end
