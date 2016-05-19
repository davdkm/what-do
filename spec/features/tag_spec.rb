describe 'Feature Test: Event', :type => :feature do

  describe "Users List" do
    before(:each) do
      @event = Event.first
      @event.users << @user
      visit event_path(@event)
    end

    it "Lists Event name" do
      expect(page).to have_content @event.name
    end
    it "lists all of the users in that event" do
      @users.each do |user|
        expect(page).to have_content user.title
        expect(page).to have_content "$#{user.price.to_f/100}"
      end
    end

    context "not logged in" do

      it 'does not display "Add To Cart" button' do
        expect(page).to_not have_content "Add To Cart"
      end

    end

    context "logged in" do
      before(:each) do
        @user = User.first
        login_as(@user, scope: :user)
      end

      it 'does display "Add To Cart" button' do
        visit event_path(@event)
        expect(page).to have_selector("input[type=submit][value='Add to Cart']")
      end
    end
  end
end
