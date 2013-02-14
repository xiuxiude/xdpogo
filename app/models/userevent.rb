class Userevent < ActiveRecord::Base
  attr_accessible :join_type, :user_id, :event_id
  belongs_to :user
  belongs_to :event
end
