class FamiliesController < ApplicationController
  
  def index
   @family = current_user.family
   @family_users = @family.users
  end
  
  def new
    @family = Family.new
    @family.users << current_user
    @token = params[:invite_token]
  end
  
  def edit
    @invite = Invite.new
  end
  
  def create
   @newUser = build_user(user_params)
   @newUser.save
   @token = params[:invite_token]
     if @token != nil
#tokenがnilでなければtokenを生成したfamilyを見つけさせる。
       @goup_token = Invite.find_by_token(@token).family
#group_tokenが一致したところに新しいユーザーを登録させる。
       @newUser.families.push(@group_token)
     else
       flash.now[:alert] = "ユーザー作成に失敗しました"
       redirect_to user_path(@user)
     end
  end
  
  #ユーザーがすでに登録済みかを確認する
  def check_user_exis
    recipient = User.find_by_email(email)
   if recipient
      self.recipient_id = recipient.id
   end
  end
   
  def show
   @family = current_user.family
   @family_users = @family.users
  end
end

