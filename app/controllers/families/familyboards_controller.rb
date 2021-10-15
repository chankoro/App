class Families::FamilyboardsController < ApplicationController
  protect_from_forgery
  
  #indexアクション
  def index
    @familyboards = current_user.family.familyboards.all
  end
  
  #newアクション
  def new
    @family = current_user.family
    @familyboard = @family.familyboards.new
  end
  
  #createアクション
  def create
    @family = current_user.family
    @familyboard = @family.familyboards.new(familyboard_params)
    @familyboard[:user_id] = current_user.id
    # @familyboard.user = current_user
    #コメントの保存がうまくいかないため

  #コメントを書き込んで保存する際の処理
    if @familyboard.save
      redirect_to family_familyboard_path(@family,@familyboard), success: '投稿に成功しました'
    else
  #失敗した際の処理
      flash.now[:alert] = '投稿に失敗しました'
      render action: :new
      #newページへ戻る
    end
  end
  
  def show
    # @family = current_user.family
    # binding.pry
    # @familyboards[:user_id] = current_user.id
    @familyboards = current_user.family.familyboards.all
  end
  
  def destroy
    familyboard = Familyboard.find(params[:id])
    familyboard.destroy
    redirect_to family_familyboards_path
  end
  
  private
  def familyboard_params
    params.require(:familyboard).permit(:family_id, :user_id, :description)
  end
  
end
