class ApplicationController < ActionController::Base
  #ログインを催促する
  before_action :require_login
  #フラッシュメッセージの指定
  add_flash_types :success, :info, :warning, :danger

  private
 
  def require_login
    redirect_to login_url unless current_user
  end

end