class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  attribute :user
end
