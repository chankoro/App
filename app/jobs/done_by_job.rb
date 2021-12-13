class DonebyJob < ApplicationJob
    queue_as :default
  def perform
    # (Workのすべてのdone_byを)
    # Work.where(id: work_ids).update_all(done_by: false)
    # Work.all.update_all(done_by: false)
    puts "Donebyjob"
  end
  
end