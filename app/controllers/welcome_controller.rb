class WelcomeController < ApplicationController
  def index
    @events = Event.order("begin_time").limit(50)
  end
end
