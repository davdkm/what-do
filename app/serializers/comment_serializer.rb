class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  attribute :user

  def user
    UserSerializer.new(object.user).attributes
  end
end
