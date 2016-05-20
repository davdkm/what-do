require 'rails_helper'

describe 'Feature Test: Tag', :type => :feature do

  describe "Tag List" do
    before(:each) do
      @event = Event.first
      @tags = Tag.all
      @event.tags << @tags
      @user = existing_user_login('testaccount@email.com', 'password')
      @event.organizer = @user
      visit event_path(@event)
    end

    it "Lists Event name" do
      expect(page).to have_content @event.name
    end

    it "lists all of the tags in that event" do
      @tags.each do |tag|
        expect(page).to have_content tag.name
      end
    end

  end
end
