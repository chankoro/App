 class CreateHouseworks < ActiveRecord::Migration[5.2]
  def change
    create_table :houseworks do |t|
     t.string :title, null: false
     t.integer :family_id
     t.integer :user_id
     t.datetime :time
     t.string :note
     t.datetime :create
     t.datetime :updated
     t.timestamps        
    end
    
  end
  
end