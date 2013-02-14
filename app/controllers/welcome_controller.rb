class WelcomeController < ApplicationController
  def index
    @events = Event.order("begin_time").limit(20)
  end
end
