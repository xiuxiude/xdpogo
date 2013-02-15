class WelcomeController < ApplicationController
  def index
    @events = Event.where("begin_time>=:date", date:Time.now)
                    .order("begin_time ASC")
  end
end
