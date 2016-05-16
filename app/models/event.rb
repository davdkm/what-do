class Event < ActiveRecord::Base
  belongs_to :organizer, :foreign_key => "user_id", :class_name => 'User'
  has_many :schedules
  has_many :users, through: :schedules#, source: :user
  has_many :comments
  has_many :event_tags
  has_many :tags, through: :event_tags
  accepts_nested_attributes_for :tags

  def self.sort_by_start_time
    self.order('start_time')
  end

  def readable_start_time
    self.start_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

  def readable_end_time
    self.end_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

  def tag_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

end
