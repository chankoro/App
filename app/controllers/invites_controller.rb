class InvitesController < ApplicationController
  def create
    # binding.pry
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
     if @invite.save
      url = invites_users_path(inqvite_token: @invite.token)
      InviteMailer.new_user_invite(invite: @invite, url: url).deliver
      @family = current_user.family
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