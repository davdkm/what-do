require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @comment = Comment.first
    @comment2 = Comment.second
    @user = User.first
  end

  it "has some content" do
    @comment.content = "Cool event bruh."
    expect(@comment.content).to eq('Cool event bruh.')
  end

  it "belongs to a user" do
    @user.comments << @comment
    @user.comments << @comment2

    expect(@user.comments.count).to eq(2)
  end

end
