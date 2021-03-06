class Family < ApplicationRecord
   authenticates_with_sorcery!
  #familyモデルの下にユーザーがいるのでFamily modelがUser modelの親になる。
  #dependent: :destroyでuserが削除されたときに一緒に削除されるようになる。
  #familyが親、userが子、houseworkが孫
  has_many :users, dependent: :destroy
  has_many :works 
  has_many :familyboards
  has_many :invites
  accepts_nested_attributes_for :users
end