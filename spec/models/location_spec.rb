require 'rails_helper'

RSpec.describe Location, type: :model do
  before(:each) do
    @location = Location.first
    @event = Event.first
  end

  it "has a name" do
    @location.name = "Times Square"
    expect(@location.name).to eq('Times Square')
  end

  it "can have an event" do
    @event.location = @location
    expect(@location.events.first).to be_a(Event)
  end

end
