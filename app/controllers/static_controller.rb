class StaticController < ApplicationController

  def home
    @events = Event.all
  end

end
