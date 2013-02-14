class AddOwneridToEvent < ActiveRecord::Migration
  def change
    add_column :events, :owner_id, :string
  end
end
