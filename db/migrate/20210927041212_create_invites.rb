class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
  #ユーザーの招待されるグループ:family
      t.integer :family_id
  #招待方法はメール
      t.string :email
  #送信者のid
      t.integer :sender_id
  #受け取り側のid
      t.integer :recipient_id
      t.string :token

      t.timestamps
    end
  end
end
