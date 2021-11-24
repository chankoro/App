class DonebyJob < ApplicationJob
  def perform
    reset_work_done_by :enviromnment do
    Work.update_all(done_by: false)
    end
  end
  
end