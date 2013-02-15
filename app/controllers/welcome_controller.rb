class WelcomeController < ApplicationController
  def index
    @events = Event.order("begin_time asc").limit(50)
  end
end
