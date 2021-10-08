class InvitesController < ApplicationController
  #招待メールを送信する前にトークンを作成させる。 
  before_create :generate_token

#メールを登録しているユーザーに招待メールを送らないようにする。
  before_save :check_user_existence

  def create
  @invite = Invite.new(invite_params)
  @invite.sender_id = current_user.id
   if @invite.save
     url = invite_users_path(invite_token: @invite.token)
     InviteMailer.with(invite: @invite, url:url).new_user_invite.deliver
   else
     flash.now[:alert] = "送信が失敗しました。"
     render :edit
   end
  end
  
  private
#トークン生成についてハッシュ化を実施する。
#Time.currentで日本時間にしている。randメソッドで乱数を使用。
#ハッシュ化する値はfamily_id、生成した時間、乱数を結合したもの
   def generate_token
    self.token = Digest::SHA1.hexdigest([self.family_id, Time.current, rand].join)
   end
  
  def check_user_existence
    recipient = User.find_by_email(email)
   if recipient
     self.recipient_id = recipient.id
   end
  end
  
  def invite_params
    params.require(:invite).permit(:family_id, :email)
  end
end
