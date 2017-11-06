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
    let(:short_route_params) { route_params.merge(time: 60, distance: 1000) }
  end

  describe "#call" do
    subject { described_class.new(route_params).call }

    it { is_expected.to eq(650) }

    context 'estimated lower than minimum fare price' do

      subject { described_class.new(short_route_params).call }

      it { is_expected.to eq(fare.minimum_price) }
    end
  end
end
