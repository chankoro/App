class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
     if @invite.save
      @family = current_user.family
      url = new_family_user_url(invite_token: @invite.token,family_id: @family)
      InviteMailer.new_user_invite(invite: @invite, url: url).deliver
      redirect_to family_path(@family)
      flash.now[:success] = "送信に成功しました"
     else
      flash.now[:danger] = "送信に失敗しました"
      render :edit
     end
  end
  
  private
  
  def invite_params
    params.require(:invite).permit(:family_id, :email)
  end
end