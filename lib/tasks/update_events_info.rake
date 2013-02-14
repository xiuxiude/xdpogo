namespace :douban do
  desc "update events info from douban "
  task :update_events_info => :environment do
    Event.all.each do |event|
      
    end
  end
end

