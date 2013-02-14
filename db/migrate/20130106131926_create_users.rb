class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.primary_key :id
      t.string  :avatar
      t.string  :signature
      t.string  :uid
      t.string  :name

      t.timestamps
    end
  end
end
