class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :readable_start_time, :readable_end_time, :description
  has_one :organizer
  has_many :users
  has_many :comments
end
