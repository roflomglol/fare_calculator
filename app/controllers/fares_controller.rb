class FaresController < ApplicationController
  def estimate
    estimation = Fares::Estimate.call(
      time_and_distance_between_points.merge(kind: kind, city_name: city_name)
    )

    render json: estimation
  end

  private

  def time_and_distance_between_points
    Estimator::CalculateTimeAndDistanceBetweenPoints.new(
      origin:      params.fetch(:origin).split(','),
      destination: params.fetch(:destination).split(',')
    ).call
  end

  def city_name
    @city_name ||= params.fetch(:city)
  end

  def kind
    @kind ||= params.fetch(:kind)
  end
end
