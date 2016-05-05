class Event < ActiveRecord::Base
  has_one :location
  belongs_to :organizer, :foreign_key => "user_id", :class_name => 'User'
  has_many :event_users
  has_many :attendees, through: :event_users, source: :user
  has_many :comments
end
