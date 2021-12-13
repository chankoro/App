class Familyboard < ApplicationRecord
  authenticates_with_sorcery!
  validates :family_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  
 belongs_to :user
 belongs_to :family
end
