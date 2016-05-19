require_relative "../rails_helper.rb"

describe 'Feature Test: User Signup', :type => :feature do

  it 'successfully signs up as non-admin' do
    user_signup
  end

  it "on sign up, successfully adds a session hash" do
    user_signup
    expect(page.get_rack_session_key('warden.user.user.key')).to_not be_nil
  end

  it 'successfully logs in as non-admin' do
    user_login
  end

  it "on log in, successfully adds a session hash" do
    user_login
    expect(page.get_rack_session_key('warden.user.user.key')).to_not be_nil
  end
end

describe 'Feature Test: User Signout', :type => :feature do

  it 'has a link to log out from the users/show page' do
    user_signup
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after logging out' do
    user_signup
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked" do
    user_signup
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end
end
