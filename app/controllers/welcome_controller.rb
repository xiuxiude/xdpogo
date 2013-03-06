class WelcomeController < ApplicationController
  caches_action :index

  def index
    @events = Event.future.order("begin_time ASC").includes(:wishers, :participanters)
  end
end
