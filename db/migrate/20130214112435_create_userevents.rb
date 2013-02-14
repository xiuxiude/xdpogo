class CreateUserevents < ActiveRecord::Migration
  def change
    create_table :userevents do |t|
      t.integer :user_id
      t.integer :event_id
      t.string  :join_type
      t.timestamps
    end
  end
end
