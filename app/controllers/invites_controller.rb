class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
      url = invites_users_path(inqvite_token: @invite.token)
      InviteMailer.new_user_invite(invite: @invite, url: url).deliver
    else
      # oh no, creating an new invitation failed
    end
  end
  
  private
  
  def invite_params
    params.require(:invite).permit(:family_id, :email)
  end
end