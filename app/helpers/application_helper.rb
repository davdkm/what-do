module ApplicationHelper

    def readable_start_time
      start_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
    end

    def readable_end_time
      end_time.localtime.strftime("%A, %d %b %Y %l:%M %p")
    end

end
