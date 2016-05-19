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

  # def admin_signup
  #   visit '/'
  #   click_link('Sign up')
  #   expect(current_path).to eq('/users/new')
  #   fill_in("user[name]", :with => "Walt Disney")
  #   find(:css, "#user_admin").set(true)
  #   click_button('Create User')
  #   expect(current_path).to eq('/users/1')
  #   expect(page).to have_content("Walt Disney")
  #   expect(page).to have_content("ADMIN")
  # end
  #
  # def admin_login
  #   @mindy = User.create(:name=>"Mindy", :happiness=>3, :nausea=>2, :tickets=>10, :height=>50)
  #   @walt = User.create(:name=>"Walt Disney", :admin=>true)
  #   visit '/'
  #   click_link('Sign in')
  #   expect(current_path).to eq('/signin')
  #   select "Walt Disney", :from => "user[id]"
  #   click_button('Sign In')
  #   expect(current_path).to eq('/users/2')
  #   expect(page).to have_content("Walt Disney")
  #   expect(page).to have_content("ADMIN")
  # end

end
