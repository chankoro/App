class Family < ApplicationRecord
   authenticates_with_sorcery!
  #familyモデルの下にユーザーがいるのでFamily modelがUser modelの親になる。
  #dependent: :destroyでuserが削除されたときに一緒に削除されるようになる。

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users
end