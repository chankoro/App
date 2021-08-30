class UserSessionsController < ApplicationController
  
  #新規登録のユーザー認証をなくす
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    
  #ログイン成功と失敗の時の場合分け 
   if @user
      redirect_back_or_to(:users, notice: 'Login successful')
   else
      flash.now[:alert] = "Login failed"
      render action: 'new'
   end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logout')
  end
end
