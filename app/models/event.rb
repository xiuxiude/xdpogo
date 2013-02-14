class Event < ActiveRecord::Base
  has_many :users, :through => :userevents
  has_many :userevents
  attr_accessible :id, :adapt_url, :title, :image, :image_hlarge, :image_lmobile,
                  :geo, :address, :album, :participant_count, :wisher_count,
                  :begin_time, :end_time, :content, :owner_id

  def self.find_with_douban(event_info)
    where(event_info.slice(:id)).first_or_initialize.tap do |event|
      event.id = event_info.id
      event.adapt_url = event_info.adapt_url
      event.content = event_info.content
      event.title = event_info.title
      event.image = event_info.image
      event.image_hlarge = event_info.image_hlarge
      event.image_lmobile = event_info.image_lmobile
      event.geo = event_info.geo
      event.owner_id = event_info.owner.uid
      event.address = event_info.address
      event.album = event_info.album
      event.participant_count = event_info.participant_count
      event.wisher_count = event_info.wisher_count
      event.begin_time = Time.parse(event_info.begin_time)
      event.end_time = Time.parse(event_info.end_time)
      event.save!
    end
  end
    
  def wishers
    User.where(
    :id => Userevent.where(:event_id=>id, :join_type=>"wish").map(&:user_id)
    )
  end
  
  def participanters
    User.where(
    :id => Userevent.where(:event_id=>id, :join_type=>"participant").map(&:user_id)
    )
  end
  
end
