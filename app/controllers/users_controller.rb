class UsersController < ApplicationController
  #未ログインをはじかない
  skip_before_action :require_login, only: [:new, :create]
  # GET /users or /users.json

  def new
    @user =User.new     
    family = Family.new
    family.users.new(user_params)
    family.save
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
  binding.pry
    if @user.save
      redirect_to login_path
      flash[:notice] =  "ユーザー作成に成功しました"
    else
      flash.now[:alert] = 'ユーザー作成に失敗しました'
      render :new
    end
  end

  private #ストロングパラメーターでpassとpass confirm
  #param is missing or the value is empty: userが発生したためrequire(:user)を削除
     def user_params
      params.permit(:email, :password, :password_confirmation)
     end
end
