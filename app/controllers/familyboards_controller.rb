class FamilyboardsController < ApplicationController
  
  #indexアクション
  def index
    @familyboards = Familyboard.all
  end
  
  #newアクション
  def new
    @familyboard = Familyboard.new
  end
  
  #createアクション
  def create
    @familyboard = current_user.familyboards.new(familyboard_params)
    #コメントの保存がうまくいかないため
      binding.pry
  #コメントを書き込んで保存する際の処理
    if @familyboard.save
      redirect_to familyboards_path, success: '投稿に成功しました'
    else
  #失敗した際の処理
      flash.now[:alert] = '投稿に失敗しました'
      render action: :new
      #newページへ戻る
    end
  end
  
  private
  def familyboard_params
    params.require(:familyboard).permit(:description)
  end
  
end
