class CreateUserStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_statuses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.timestamps
    end
  end
end
