class CreateWorkStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :work_statuses do |t|
      t.references :work, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.timestamps
    end
  end
end