class HouseworksController < ApplicationController
  
  protect_from_forgery
  
  def index
  #新規登録用に取得
     @housework = Housework.new
  #一覧画面ですべてが見れるように全部取得
     @houseworks = Housework.all
  end
  
  #new.viewと共有
  def new
    @housework = Housework.new
  end
  
  
  def create
#ログインしているユーザーのみ作成できるのでcurrent_userを入れている。
    @housework = current_user.houseworks.new(housework_params)

     if @housework.valid?
     if @housework.save
       redirect_to houseworks_path
       flash[:notice] = "家事作成に成功しました"
     else
       flash.now[:alert] = "家事作成に失敗しました"
       render :new
     end
     end
  end
  
 
  #編集、編集するために対象のidを拾ってくる。
  def edit
    @housework = Housework.find(params[:id])
  end
  
  #更新
  def update
    @housework = Housework.find(params[:id])
    @housework.update(housework_params)
    redirect_to housework_path(housework_params)
  end
  
  #削除機能
  def destroy
    housework = Housework.find(params[:id])
    housework.destroy
    redirect_to houseworks_path
  end
  
  #ストロングパラメータで作業名を表す:title,更新時間を表す:time,メモを残す:note,曜日:wday
  private
    def housework_params
    params.require(:housework).permit(:title,:time,:note,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday)
    
    end
    
  #日付を取得させて、曜日を表示させるための定義。
    def date_today 
  #今は、今日と定義
     @now = Date.today
  #曜日を配列によって指定する。月だったら値は0
  　 @wday = ["月","火","水","木","金","土","日"]
    end
     
  end