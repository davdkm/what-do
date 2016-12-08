require 'rails_helper'

RSpec.describe Event, :type => :model do
  before(:each) do
    @event = create(:event)
    @user = create(:user)
    @user2 = create(:user)
    @comment = create(:comment)
  end

  it 'has a location' do
    @event.location = 'Pershing Square'
    expect(@event.location).to eq('Pershing Square')
  end

  it 'has many users' do
    @event.users << @user
    @event.users << @user2
    expect(@event.users).to include(@user)
    expect(@event.users).to include(@user2)
  end

  it 'has an event organizer' do
    @event.organizer = @user
    expect(@event.organizer).to eq(@user)
  end

  it 'has many comments' do
    @event.comments << @comment
    expect(@event.comments).to include(@comment)
  end

end
