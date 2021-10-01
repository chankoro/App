class Families::FamilyboardsController < ApplicationController
  
  #indexアクション
  def index
    @familyboards = Familyboard.all
  end
  
  #newアクション
  def new
    @familyboard = current_user.familyboards.new
    @family = Family.find_by(id: params[:family])
  end
  
  #createアクション
  def create
    @familyboard = current_user.familyboards.new(familyboard_params)
    @family = Family.find_by(id: params[:family])
    #コメントの保存がうまくいかないため
    binding.pry
  #コメントを書き込んで保存する際の処理
    if @familyboard.save
      @familyboard.family_id = family.id
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
