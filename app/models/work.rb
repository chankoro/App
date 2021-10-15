class Work < ApplicationRecord
authenticates_with_sorcery!
#houseworkは個人で登録し家族で共有する。
#モデルはfamily,user,houseworkの順
belongs_to :user
has_one :family, through: :user

#user_idと記述をvalidate
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
#〇曜日が空だったらを全曜日に当てはめる。
validate :checked

def checked
  if monday == false && tuesday == false && wednesday == false && thursday == false \
    && friday == false && saturday == false && sunday == false
  end
end
end