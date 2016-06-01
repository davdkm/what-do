class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

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

end
