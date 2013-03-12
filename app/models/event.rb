class Event < ActiveRecord::Base
  has_and_belongs_to_many :wishers, :class_name => User, :join_table => "wish_users"
  has_and_belongs_to_many :participanters, :class_name => User, :join_table => "participation_users"

  # attr_accessible :id, :adapt_url, :title, :image, :image_hlarge, :image_lmobile,
  #                 :geo, :address, :album, :participant_count, :wisher_count,
  #                 :begin_time, :end_time, :content, :owner_id

  scope :future, -> { where("begin_time >= ?", Time.now) }

  def self.find_with_douban(event_info)
    raw_parameters = event_info.slice(:id, :adapt_url, :content, :title, :image_lmobile,
                                    :image_hlarge, :image, :geo, :address, :album,
                                    :participant_count, :wisher_count)
    raw_parameters[:owner_id] = event_info.owner.id
    raw_parameters[:begin_time] = Time.parse(event_info.begin_time)
    raw_parameters[:end_time] = Time.parse(event_info.end_time)
    parameters = ActionController::Parameters.new(raw_parameters)
    new_event = find_or_initialize_by(event_info.slice(:id))
    new_event.update_attributes(parameters.permit!)
  end
    
  def douban_url
    "http://www.douban.com/event/#{id}/"
  end
end
