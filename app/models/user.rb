class User < ActiveRecord::Base
  has_and_belongs_to_many :wish, :class_name => Event, :join_table => "wish_users"
  has_and_belongs_to_many :participant, :class_name => Event, :join_table => "participation_users"
  
  # attr_accessible :id, :avatar, :name, :signature, :uid
  def self.find_with_douban(user_info)
    raw_parameters = user_info.slice(:avatar, :name, :signature, :uid)
    parameters = ActionController::Parameters.new(raw_parameters)
    new_user = find_or_initialize_by(user_info.slice(:id))
    new_user.update_attributes(parameters.permit!)
  end
  
  def douban_url
    "http://www.douban.com/people/#{id}/"
  end
  
  def large_avatar
    avatar.gsub(/\/u/, '/ul') 
  end
end
