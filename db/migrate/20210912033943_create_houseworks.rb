class CreateHouseworks < ActiveRecord::Migration[5.2]
  def change
    create_table :houseworks do |t|
      t.string :title
      t.integer :user_id
      t.datetime :time
      t.text :note
      t.timestamps
    end
  end
end
