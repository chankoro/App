class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.integer :family_id
      t.string :name
      t.timestamps                null: false
    end

  #Emailの重複を許さないため unique :true
    add_index :users, :email, unique: true
  end
end
