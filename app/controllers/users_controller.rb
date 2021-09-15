class UsersController < ApplicationController
  
  protect_from_forgery :except => ["destroy","logout"]
  #未ログインをはじかない
  skip_before_action :require_login, only: [:new, :create]
  # GET /users or /users.json

  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
  # user登録で入力情報に問題がない場合
    if @user.valid?
      family = Family.new(name: params[:user][:family])
      if family.save
        @user.family_id = family.id
      end
    end

    if @user.save
      redirect_to user_path(@user)
      flash[:notice] = "ユーザー作成に成功しました"
    else
      flash.now[:alert] = "ユーザー作成に失敗しました"
      render :new
    end
  end


  def show
     @users = User.all
  end

 def edit
    @user = user.find(params[:id])
 end

  private #ストロングパラメーターでpassとpass confirm
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end

  