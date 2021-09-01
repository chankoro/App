class ApplicationController < ActionController::Base
#ログインを催促する
  before_action :require_login
　add_flash_types :success, :info, :warning, :danger　

private
#ログインしていなかったらrequire_loginの中で作動する
  def not_authenticated
    redirect_to login_path, alert: "Please Login first"
  end
 end


