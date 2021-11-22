class User < ApplicationRecord
  #sorceryを有効にするための宣言
  authenticates_with_sorcery!

  #invite_model  
  has_many :invitations, class_name: "Invite", foreign_key: "recipient_id"
  has_many :sent_invites, class_name: "Invite", foreign_key: "sender_id"

#if: -> { new_record? || changes[:crypted_password] }でユーザーがパスワード以外のプロフィール項目更新の時にパスワード入力を省略できる
  validates :password, length: { in: 4..20 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,format:{ with: VALID_EMAIL_REGEX }, uniqueness: true

#Family modelの下にUser modelが存在する。
  belongs_to :family, optional: true
#user modelの下にhouseworks modelとfamilyboard modelが存在する。
  has_many :works, foreign_key: :done_by
  has_many :familyboards
end
