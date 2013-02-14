class User < ActiveRecord::Base
  has_many :events, :through => :userevents
  has_many :userevents  
  attr_accessible :id, :avatar, :name, :signature, :uid
  
  def self.find_with_douban(user_info)
    # where(user_info.slice(:id)).first_or_initialize.tap do |user|
    #   user.id = user_info.id
    #   user.avatar = user_info.avatar
    #   user.name = user_info.name
    #   user.signature = user_info.signature
    #   user.uid  = user_info.uid
    #   user.save!
    # end
    where(user_info.slice(:id)).first_or_create(
      user_info.slice(:id, :avatar, :name, :signature, :uid)
      )
  end
  
  def douban_url
    "http://www.douban.com/people/#{id}/"
  end
end
