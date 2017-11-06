module Fares
  class Estimate
    attr_reader :city_name, :kind, :time, :distance

    def initialize(city_name:, kind:, time:, distance:)
      @city_name   = city_name
      @kind        = kind
      @time        = time
      @distance    = distance
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      estimated = fare.pickup + (time / 60) * fare.per_minute + (distance / 1000) * fare.per_km

      if estimated < fare.minimum_price
        fare.minimum_price
      else
        estimated
      end
    end

    private

    def fare
      @fare ||= Fare.find_by(city: city, kind: kind)
    end

    def city
      @city ||= City.where('lower(name) = ?', city_name)
    end
  end
end
