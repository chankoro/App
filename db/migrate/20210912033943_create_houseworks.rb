 class CreateHouseworks < ActiveRecord::Migration[5.2]
  def change
    create_table :houseworks do |t|
     t.string :title, null: false
     t.integer :family_id
     t.integer :user_id
     t.string :note
     t.integer :done_by
     t.datetime :done_at
     t.timestamps        
    end
  end
 end