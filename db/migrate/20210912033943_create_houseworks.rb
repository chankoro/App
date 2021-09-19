 class CreateHouseworks < ActiveRecord::Migration[5.2]
  def change
    create_table :houseworks do |t|
     t.string :title, null: false
     t.integer :family_id
     t.integer :user_id
     t.datetime :time
     t.string :note
     t.integer :wday
     t.datetime :created_at 
     t.datetime :updated_at 
     t.timestamps        
    end
    
  end
  
end