class CreateUserevents < ActiveRecord::Migration
  def change
    create_table :wish_users, :id => false do |t| 
      t.integer :event_id
      t.integer :user_id
    end 

    create_table :participation_users, :id => false do |t| 
      t.integer :event_id
      t.integer :user_id
    end 
  end
end
