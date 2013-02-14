class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
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
      t.time   :begin_time
      t.time   :end_time
      
      
 
      t.timestamps
    end
  end
end
