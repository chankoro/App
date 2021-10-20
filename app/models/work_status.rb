class WorkStatus < ApplicationRecord
#workとstatus　modelの中間model
　belongs_to :work
　belongs_to :status
end
