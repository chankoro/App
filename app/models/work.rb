class Work < ApplicationRecord
authenticates_with_sorcery!

#user_idと記述をvalidate
validates :family_id, presence: true
validates :user_id, presence: true
validates :title, presence: true

#曜日カラムをtrueかfalseだけにする
with_options inclusion: {in: [true, false]} do
  validates :monday
  validates :tuesday
  validates :wednesday
  validates :thursday
  validates :friday
  validates :saturday
  validates :sunday
end

#曜日カラムが必ず選択されるようにする。
validate :checked
def checked
  if monday == false && tuesday == false && wednesday == false && thursday == false \
    && friday == false && saturday == false && sunday == false
  end
end

#houseworkは個人で登録し家族で共有する。
#モデルはfamily,user,houseworkの順
belongs_to :user, class_name: 'User' , foreign_key: :done_by
belongs_to :family 

end