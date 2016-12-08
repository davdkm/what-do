require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = build_stubbed(:user, name: 'Nathan', email: 'nathan@email.com')
  end

  it 'has a name' do
    expect(@user.name).to eq('Nathan')
  end

  it 'has an email address' do
    expect(@user.email).to eq('nathan@email.com')
  end

  describe '#Associations' do
    before(:each) do
      @event = create(:event)
    end

    it 'can organize an event' do
      @event.organizer = @user

      expect(@event.organizer).to be_kind_of(User)
      expect(@event.organizer.name).to eq('Nathan')
    end

    it 'can write a comment' do
      @comment = create(:comment, user: @user, event: @event, content: 'SWAG')

      expect(@user.comments.size).to eq(1)
      expect(@user.comments.first).to be_kind_of(Comment)
      expect(@user.comments.first.content).to eq('SWAG')
    end

    describe '# Events' do
      before(:each) do
        @new_user = create(:user, name: 'Brian', email: 'brian@email.com')
        @schedule = Schedule.create(user: @new_user, event: @event)
      end

      it 'can attend an event' do

        expect(@event.users.size).to eq(1)
        expect(@event.users.first.name).to eq('Brian')
        expect(@new_user.events.first).to be_kind_of(Event)
      end

      it 'cannot attend the same event twice' do
        @new_schedule = Schedule.create(user: @new_user, event: @event)

        expect(@event.users.size).to eq(1)
      end

    end
  end



end
