class User < ApplicationRecord
  authenticates_with_sorcery!

#if: -> { new_record? || changes[:crypted_password] }でユーザーがパスワード以外のプロフィール項目更新の時にパスワード入力を省略できる
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true

#Family modelの下にUser modelが存在する。
  belongs_to :family, optional: true
end
