require "rails_helper"

RSpec.describe Fares::Estimate do
  let(:fare) { create(:fare) }
  let(:route_params) do
    {
      city_name: fare.city.name.downcase,
      kind: fare.kind,
      time: 600,
      distance: 10000
    }
  end
  let(:short_route_params) { route_params.merge(time: 60, distance: 1000) }

  describe "#call" do
    subject { described_class.new(route_params).call }

    specify 'estimated_min key' do
      expect(subject.fetch(:estimated_min)).to eq((650 * 0.9).round)
    end

    specify 'estimated_max key' do
      expect(subject.fetch(:estimated_max)).to eq((650 * 1.1).round)
    end

    context 'estimated lower than minimum fare price' do
      subject { described_class.new(short_route_params).call }

      specify 'estimated_min key' do
        expect(subject.fetch(:estimated_min)).to eq(fare.minimum_price)
      end

      specify 'estimated_max key' do
      expect(subject.fetch(:estimated_max)).to eq(fare.minimum_price)
      end
    end
  end
end
