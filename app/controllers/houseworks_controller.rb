class HouseworksController < ApplicationController
  
  #new.viewと共有
  def new
    @housework = Housework.new
  end
  
  
  def create
    housework = Housework.new(housework_params)
    housework.save
    #データベースへ保存後投稿画面へ戻る
    redirect_to housework_path(housework.id)
  end
  
  #登録した家事をすべてのデータを取り出して格納するからインスタンス変数名を複数形
  def index
    @houseworks = Housework.all
  end
  
  #登録した家事一覧を表示する。
  def show
    @housework = Housework.find(params[:id])
  end
  
  #ストロングパラメータで作業名を表す:title,更新時間を表す:time,メモを残す:note
  private
    def housework_params
    params.require(:housework).permit(:title,:time,:note)
    end
  
end
