class Housework < ApplicationRecord
authenticates_with_sorcery!

#user_idと記述をvalidate
validates :user_id, presence: true
#houseworkは個人で登録し家族で共有する。
#モデルはfamily,user,houseworkの順
belongs_to :user
has_one :family, through: :user
end