class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def create
    @user = login(params[:email], params[:password])
    
    if @user
      redirect_back_or_to root_path, notice: 'ログイン成功'
    else
      flash.now[:alert] = 'ログイン失敗'
      render action: 'new'
    end
  end
  
  def destroy
    logout
    redirect_to(:users, notice: 'ログアウトしました')
  end
end

#ログインしたらルートパスにリダイレクトします。
#loginメソッドで、認証処理を実施。@user=login(params[:email],params[:password])でemailによるUsEr検索、パスワードの検証。正常に処理できるセッションデータにUserレコードのid値えお格納する。
#redirect_back_or_toは、ユーザーがアクセスしようとしたページでログインが必要になり、ログイン認証されたら、最初にアクセスしようとしたページにリダイレクトする。
