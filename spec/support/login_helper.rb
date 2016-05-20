module LoginHelper

  def user_signup
    visit '/'
    click_link('Sign Up')
    expect(current_path).to eq('/users/sign_up')
    fill_in("user[name]", :with => "Amy Poehler")
    fill_in("user[email]", :with => "test@email.com")
    fill_in("user[password]", :with => "password")
    fill_in("user[password_confirmation]", :with => "password")
    click_button('Sign up')
    visit user_path(1)
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Amy Poehler")
  end

  def user_login
    @mindy = User.create(:name=>"Mindy", :email => 'mindy@email.com', :password => 'password', :password_confirmation => 'password')
    visit '/'
    click_link('Sign In')
    expect(current_path).to eq('/users/sign_in')
    fill_in("user[email]", :with => "mindy@email.com")
    fill_in("user[password]", :with => "password")
    click_button('Log in')
    visit user_path(@mindy)
    expect(current_path).to eq("/users/#{@mindy.id}")
    expect(page).to have_content("Mindy")
  end

  def existing_user_login(email, password)
    visit '/'
    click_link('Sign In')
    expect(current_path).to eq('/users/sign_in')
    fill_in("user[email]", :with => email)
    fill_in("user[password]", :with => password)
    click_button('Log in')
  end

end
