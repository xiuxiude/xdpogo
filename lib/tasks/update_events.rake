namespace :douban do
  desc "update events from douban"
  task :update_events => :environment do
    events = Douban.events(LOC_ID,
      :type => "music",
      :day_type => "future",
      :count => 50
      )
    events.each do |event_info|
      Event.find_with_douban(event_info)
    end
  end
end