class EventSerializer < ActiveModel::Serializer
  attributes :id, :location, :readable_start_time, :readable_end_time, :description
  belongs_to :organizer
end
