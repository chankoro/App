class ApplicationController < ActionController::Base
<<<<<<< HEAD
#ログアウト後のユーザ編集ができないようにする
  before_action :require_login
end

#ログアウトユーザーから保護。ログアウト中にユーザーを編集し、拒否されてログインフォームにログインすると、自動的に編集ページに移動
  private
  def not_authenticated
    redirect_to login_path, alert: "Please Login first"
  end
   


=======
end
>>>>>>> origin/master
