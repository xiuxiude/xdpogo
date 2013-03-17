class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, :id => false do |t|
      t.primary_key :id
      t.string :adapt_url
      t.string :title
      t.text   :content
      t.string :image
      t.string :image_hlarge
      t.string :image_lmobile
      t.string :geo
      t.string :address
      t.string :album
      t.integer :participant_count
      t.integer :wisher_count
      t.datetime   :begin_time
      t.datetime   :end_time
      
      
 
      t.timestamps
    end
  end
end
