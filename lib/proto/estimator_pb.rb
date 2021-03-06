# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: estimator.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "estimator.PointsInfo" do
    optional :origin, :message, 1, "estimator.Origin"
    optional :destination, :message, 2, "estimator.Destination"
  end
  add_message "estimator.Origin" do
    optional :lat, :string, 1
    optional :long, :string, 2
  end
  add_message "estimator.Destination" do
    optional :lat, :string, 1
    optional :long, :string, 2
  end
  add_message "estimator.DirectionsInfo" do
    optional :time, :int32, 1
    optional :distance, :int32, 2
  end
end

module Estimator
  PointsInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("estimator.PointsInfo").msgclass
  Origin = Google::Protobuf::DescriptorPool.generated_pool.lookup("estimator.Origin").msgclass
  Destination = Google::Protobuf::DescriptorPool.generated_pool.lookup("estimator.Destination").msgclass
  DirectionsInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("estimator.DirectionsInfo").msgclass
end
