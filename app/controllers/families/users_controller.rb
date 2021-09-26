class Families::UsersController < ApplicationController
protect_from_forgery :except => ["destroy","logout"]

def new
  @family = current_user.family
  @user = @family.users.new
end

def create
  @family = Family.find(params[:family_id])
  @user = @family.users.new(user_params)
  
  if @user.save
    redirect_to family_path(@family)
    flash[:notice] = "ユーザー作成に成功しました"
  else
    flash.now[:alert] = "ユーザー作成に失敗しました"
    render :new
  end
end

private #ストロングパラメーターでpassとpass confirm
  def user_params
    params.require(:user).permit(:family_id, :name, :email, :password, :password_confirmation)
  end
  
end