class Event < ActiveRecord::Base
  has_one :location
  belongs_to :organizer, :foreign_key => "user_id", :class_name => 'User'
  has_many :schedules
  has_many :users, through: :schedules#, source: :user
  has_many :comments

  def self.sort_by_start_time
    self.order('start_time')
  end

  def readable_start_time
    self.start_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

  def readable_end_time
    self.end_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

end
