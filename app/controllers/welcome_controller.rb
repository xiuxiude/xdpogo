class WelcomeController < ApplicationController
  caches_page :index

  def index
    @events = Event.where("begin_time>=:date", date:Time.now)
                    .order("begin_time ASC")
  end
end
