require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it "has many events" do
    @user.events.create
    expect(@user.events.count).to eq(1)
  end

  it "has many comments" do
    @user.comments = @user.comments.create
    expect(@user.comments).to be_a(Comment)
  end

end
