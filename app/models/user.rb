class User < ApplicationRecord
  #sorceryを有効にするための宣言
  authenticates_with_sorcery!

  #invite_model  
  has_many :invitations, class_name: "Invite", foreign_key: "recipient_id"
  has_many :sent_invites, class_name: "Invite", foreign_key: "sender_id"

#if: -> { new_record? || changes[:crypted_password] }でユーザーがパスワード以外のプロフィール項目更新の時にパスワード入力を省略できる
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true

#Family modelの下にUser modelが存在する。
  belongs_to :family, optional: true
#user modelの下にhouseworks modelとfamilyboard modelが存在する。
  has_many :works
  has_many :familyboards
  has_many :user_statuse
end
