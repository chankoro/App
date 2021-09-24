class Familyboard < ApplicationRecord
  validates :family_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  
 belongs_to :user
 has_one :family, through: :user
end