require 'estimator_services_pb'

module Estimator
  class CalculateTimeAndDistanceBetweenPoints
    attr_reader :origin, :destination

    def initialize(origin:, destination:)
      @origin = origin
      @destination = destination
    end

    def call
      stub = Estimator::Estimate::Stub.new(ENV.fetch("ESTIMATOR_API"), :this_channel_is_insecure)
      response = stub.time_and_distance_between_points(message)

      { time: response.time, distance: response.distance }
    end

    private

    def message
      origin_message = Origin.new(lat: origin[0], long: origin[1])
      destination_message = Destination.new(lat: destination[0], long: destination[1])

      PointsInfo.new(origin: origin_message, destination: destination_message)
    end
  end
end
