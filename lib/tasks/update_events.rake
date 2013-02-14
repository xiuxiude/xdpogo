namespace :douban do
  desc "update events from douban"
  task :update_events => :environment do
    loc_id = 118371
    events = Douban.events(loc_id,
      :type => "music",
      :day_type => "future",
      :count => 50
      )
    events.each do |event_info|
      Event.find_with_douban(event_info)
    end
  end
end