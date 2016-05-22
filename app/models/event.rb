class Event < ActiveRecord::Base
  belongs_to :organizer, :foreign_key => "user_id", :class_name => 'User'
  has_many :schedules
  has_many :users, through: :schedules#, source: :user
  has_many :comments
  has_many :event_tags
  has_many :tags, through: :event_tags
  accepts_nested_attributes_for :tags

  validates_presence_of :description, :name, :location, :start_time, :end_time
  validate :event_cannot_start_in_the_past, :event_cannot_end_before_start_time

  def start_time
    super.in_time_zone(time_zone) if time_zone
  end

  def end_time
    super.in_time_zone(time_zone) if time_zone
  end

  def self.sort_by_start_time
    self.order('start_time')
  end

  def readable_start_time
    self.start_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

  def readable_end_time
    self.end_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute) if tag_attribute[:name].present?
      self.tags << tag if tag
    end
  end

  def event_cannot_start_in_the_past
    if self.start_time.present? && self.start_time < DateTime.now
      errors.add(:start_time, "Event cannot start in the past")
    end
  end

  def event_cannot_end_before_start_time
    if self.end_time.present? && self.start_time.present? && self.end_time < self.start_time
      errors.add(:start_time, "Event cannot end before it starts.")
    end
  end

end
