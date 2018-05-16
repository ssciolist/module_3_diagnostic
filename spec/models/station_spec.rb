require 'spec_helper'

describe Station, type: :model do
  subject { Station.new(name: "mine", address: "123 street", fuel_type: "ELEC", distance: 0.4, access_times: "24/7 baby")}
  it 'exists with valid attributes' do
    expect(subject.name).to eq("mine")
  end
end
