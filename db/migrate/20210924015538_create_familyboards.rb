class CreateFamilyboards < ActiveRecord::Migration[5.2]
  def change
    create_table :familyboards do |t|
      t.integer :family_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
