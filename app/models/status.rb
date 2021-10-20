class Status < ApplicationRecord
  #work modelとのつながり
  has_many :works, through: :work_statuses
  has_many :work_statuses
  #work_status modelを一括で更新、保存
  accepts_nested_attributes_for :work_statuses
  #user modelとのつながり
  has_many :users, through: :user_statuses
  has_many :user_statuses
  #user_status modelを一括で更新、保存
  accepts_nested_attributes_for :user_statuses
end
