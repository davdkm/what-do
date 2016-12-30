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

  describe '# Valid times' do

    it 'has a valid start and end time' do
      @event.start_time = '2020-01-31 10:00:00 -0800'
      @event.end_time = '2020-01-31 23:00:00 -0800'

      expect(@event.valid?).to be true
      expect(@event.readable_start_time).to include('31 Jan 2020 10:00 AM')
      expect(@event.readable_end_time).to include('31 Jan 2020 11:00 PM')
    end

    it 'can not start in the past' do
      @event.start_time = '2000-01-31 10:00:00 -0800'

      expect(@event.valid?).to be_falsey
    end

    it 'can not end in the past' do
      @event.end_time = '2000-01-31 10:00:00 -0800'

      expect(@event.valid?).to be_falsey
    end

    it 'can not start before it ends' do
      @event.start_time = '2020-01-31 23:00:00 -0800'
      @event.end_time = '2020-01-31 10:00:00 -0800'

      expect(@event.valid?).to be_falsey
    end

    it 'has to have a duration' do
      @event.start_time = '2020-01-31 10:00:00 -0800'
      @event.end_time = '2020-01-31 10:00:00 -0800'

      expect(@event.valid?).to be_falsey
    end

    context "with a picture" do
      it "has a :thumb style" do

      expect(@event.cover_image.styles[:thumb]).to_not eq nil
      end

      it "has a default" do

        expect(@event.cover_image.url).to_not eq /image-placeholder.jpg/
      end
    end

  end
end
