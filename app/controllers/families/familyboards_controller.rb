class Families::FamilyboardsController < ApplicationController
  
  #indexアクション
  def index
    @familyboards = Familyboard.all
  end
  
  #newアクション
  def new
    @family = current_user.family
    @familyboard = @family.familyboards.new
  end
  
  #createアクション
  def create
    binding.pry
    @family = Family.find(params[:family])
    @familyboard = @family.familyboards.new(familyboard_params)
    #コメントの保存がうまくいかないため

  #コメントを書き込んで保存する際の処理
    if @familyboard.save
      redirect_to family_path(@family), success: '投稿に成功しました'
    else
  #失敗した際の処理
      flash.now[:alert] = '投稿に失敗しました'
      render action: :new
      #newページへ戻る
    end
  end
  
  private
  def familyboard_params
    params.require(:familyboard).permit(:family_id, :user_id, :description)
  end
  
end
