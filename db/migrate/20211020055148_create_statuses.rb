class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
     t.string :status
     t.datetime :done
     
      t.timestamps
    end
  end
end
