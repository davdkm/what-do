class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validate :already_attending?

  def match_transportation
    index = 0
    Transportation::TYPE.each_with_index do |transport, i|
      index = i if self.transportation == transport
    end
    Transportation::TYPE[index]
  end

  def sort_by_event_start_time
    events.order('start_time')
  end

  def already_attending?
    errors.add(:user, "You are already attending this event") unless Schedule.where(event: self.event.id, user: self.user.id).size == 0
  end

end
