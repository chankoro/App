class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  protect_from_forgery :except => ["destroy"]
#loginメソッドで認証処理を実施。
#Login()で()内の検証と検索を行う。
  def create
    @user = login(params[:email], params[:password])
#正常に処理するとセッションデータにUserレコードのid値を格納させる。
    if @user
      redirect_back_or_to root_path, notice: 'ログイン成功'
#redirect_back_or_toでユーザーがアクセスしようとしたページでログインが必要になり、ログイン認証されたら、アクセスしようとしたページにリダイレクトさせる。
    else
      flash.now[:alert] = 'ログイン失敗'
      render action: 'new'
#ログインに失敗したらuser_sessions/newにもどる。
    end
  end
  
  def destroy
    logout
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
   def log_in(user)
     session[:user_id] = user.id
   end
   
   def log_out
     session.delete(:user_id)
     @current_user = nil
   end
end

#ログインしたらルートパスにリダイレクトします。
#loginメソッドで、認証処理を実施。@user=login(params[:email],params[:password])でemailによるUsEr検索、パスワードの検証。正常に処理できるセッションデータにUserレコードのid値えお格納する。
#redirect_back_or_toは、ユーザーがアクセスしようとしたページでログインが必要になり、ログイン認証されたら、最初にアクセスしようとしたページにリダイレクトする。
