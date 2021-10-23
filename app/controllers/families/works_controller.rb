class Families::WorksController < ApplicationController
  
  protect_from_forgery
  
  def index
    @works = current_user.family.works.all
  end
  
  #new.viewと共有
  def new
    @family = current_user.family
    @work = @family.works.new
  end
  
  
  def create
#ログインしているユーザーのみ作成できるのでcurrent_userを入れている。
    @family = current_user.family
    @work = @family.works.new(work_params)
    @work[:user_id] = current_user.id
    # binding.pry
     if @work.valid? 
#家事を保存する
     if @work.save
       redirect_to family_works_path(@family)
       flash[:notice] = "家事作成に成功しました"
     else
       flash.now[:alert] = "家事作成に失敗しました"
       render :new
     end
     end
  end
  
  def show
    # @family = current_user.family
    # @work[:user_id] = current_user.id
    @works = current_user.family.works.all
  end
  
  def weekly
    @family = current_user.family
    @works = current_user.family.works.all
  end
 
  #編集、編集するために対象のidを拾ってくる。
  def edit
    @family = current_user.family
    @work = Work.find(params[:id])
  end
  
  #更新
  def update
    @family = current_user.family
    @work = Work.find(params[:id])
    @Work.update(work_params)
    redirect_to family_work_path(works_path)
  end
  
  #削除機能
  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to family_works_path
  end
  
  def done
    @work = Work.find(params[:id])
    @work.done_by = current_user.id
    @work.done_at = Time.now
    @work.save
    redirect_to weekly_family_works_path(params[:family_id])
  end
  
  #ストロングパラメータで作業名を表す:title,更新時間を表す:time,メモを残す:note,曜日:wday
  private
    def work_params
    params.require(:work).permit(:family_id,:user_id,:title,:time,:note,:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday)
    
    end
    
  #日付を取得させて、曜日を表示させるための定義。
    def date_today 
  #今は、今日と定義
     @now = Date.today
  #曜日を配列によって指定する。月だったら値は0
  　 @wday = ["月","火","水","木","金","土","日"]
    end
     
  end