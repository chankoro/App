class Family < ApplicationRecord
  #familyモデルの下にユーザーがいるのでFamily modelがUser modelの親になる。
  #dependent: :destroyでuserが削除されたときに一緒に削除されるようになる。
  
  has_many :user, dependent: :destroy
  accepts_nested_attributes_for :user
end
