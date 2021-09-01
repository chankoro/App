class UsersController < ApplicationController
  #未ログインをはじかない
  skip_before_action :require_login, only: [:new, :create]
  # GET /users or /users.json

  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash[:notice] =  "ユーザー作成に成功しました"
    else
      flash.now[:alert] = 'ユーザー作成に失敗しました'
      render :new
    end
  end

  private #ストロングパラメーターでpassとpass confirm
  
     def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
     end
end
