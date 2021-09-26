class UsersController < ApplicationController
  
  protect_from_forgery :except => ["destroy","logout"]
  #未ログインをはじくようにする。
  skip_before_action :require_login, only: [:new, :create]
  # GET /users or /users.json
 #form_forでUserに紐づいたformを作成したいのでUserをインスタンス変数に保存させる。
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
# user登録で入力情報に問題がない場合
    if @user.valid?
#familyもuser登録と一緒にしたいからfamilyも作成する。familyの中にはuserの情報とfamilyの情報を入れる。%>
      family = Family.new(name: params[:user][:family])
      if family.save
#familyの中にuserがいるのでuserのfamily_idはfamily modelのfamily.idとする。
        @user.family_id = family.id
      end
    end

    if @user.save
      redirect_to root_path(@user)
      flash[:notice] = "ユーザー作成に成功しました"
    else
      flash.now[:alert] = "ユーザー作成に失敗しました"
#失敗した場合はユーザー登録をやり直させるためにrender :new
      render :new
    end
  end

#表示はログインしてるユーザーをすべて表示したいから.all
  def show
     @user = current_user
  end

#編集機能としてfindで検索して表示させる。
#モデル.find(表示する対象、今回はuserのid)
 def edit
    @user = User.find(params[:id])
 end
 
 def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(user_params)
 end

  private #ストロングパラメーターでpassとpass confirm
  def user_params
    params.require(:user).permit(:family_id, :name, :email, :password, :password_confirmation)
  end
  
end

  