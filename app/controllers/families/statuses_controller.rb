class Families::StatusesController < ApplicationController
  
  def create
    @family = current_user.family
    @status = @family.statuses.new(status_params)
    @status.user = current_user
    
    if status.save
      redirect_to weekly_family_works_path(@family),success: "完了しました。"
    else
      redirect_to weekly_family_works_path(@family),success: "記録に失敗しました"
    end
  end
end

private 
def status_params
 params.require(:status_params).permit(:family_id, :user_id, :work_id, :done,)
end