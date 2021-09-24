class ApplicationController < ActionController::Base
  #CSRF対策
  protect_from_forgery with: :exception
  #ログインを催促する
  before_action :require_login
  #フラッシュメッセージの指定
  add_flash_types :success, :info, :warning, :danger

  private
  #current_userを定義。現在ログインしているユーザーあるいはUser_idを取得してtrueになる。
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  #current_userが存在しない⇒current_userがいない
  def logged_in?
    !current_user.nil?
  end
 
 #ログインを催促する。
  def require_login
    redirect_to login_url unless current_user
  end

end