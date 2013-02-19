namespace :douban do
  desc "update events info from douban "
  task :update_events_info => :environment do
    Event.where("begin_time>=:date", date:Time.now).each do |event|
      p event
      wishers = get_users(:event_wishers, event.id).map{|u| u.id.to_i}
      participanters = get_users(:event_participants, event.id).map{|u| u.id.to_i}
      users = User.all.map(&:id)
      event.wishers = User.where(:id=>wishers&users)
      event.participanters = User.where(:id=>participanters&users)
      sleep 3
    end
  end
  
  def get_users(user_type, id)
    start = 0
    results = []
    begin
      users = Douban.send(user_type, id, :count=>50, :start=>start)
      start += 50
      results += users
    end while users.size == 50
    results
  end
end

