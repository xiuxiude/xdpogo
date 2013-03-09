class AddIndexToWishUsersAndParticipationUsers < ActiveRecord::Migration
  def change
    change_table :wish_users do |t|
      t.index :event_id
      t.index :user_id
    end
    
    change_table :participation_users do |t|
      t.index :event_id
      t.index :user_id
    end
  end
end
