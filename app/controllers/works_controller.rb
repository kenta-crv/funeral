class WorksController < ApplicationController
    before_action :authenticate_admin!, only: [ :edit, :update, :destroy, :send_mail]
  
    def index
      @works = Work.without_ng_status.order(created_at: :desc).page(params[:page])
    end
    
    def new
      @work = Work.new
    end
    
    def create
      @work = Work.new(work_params)
      if @work.save
        if admin_signed_in?
          WorkMailer.received_email(@work).deliver # 管理者に通知
          flash[:notice] = "管理者送信のため、取引先にはメールを送らず完了しました。"
        else
          WorkMailer.received_email(@work).deliver # 管理者に通知
          WorkMailer.send_email(@work).deliver # 送信者に通知
        end
        redirect_to works_path, notice: "作業が正常に登録されました。"
      else
        flash.now[:alert] = "登録に失敗しました。入力内容を確認してください。"
        render :new
      end
    end
  
    def show
      @work = Work.find(params[:id])
      @progress = Progress.new # この行を削除
      @progresses = @work.progresses # すべてのprogressを取得する
    end
  
    def edit
      @work = Work.find(params[:id])
    end
  
    def destroy
      @work = Work.find(params[:id])
      @work.destroy
      redirect_to works_path, alert:"削除しました"
    end
  
    def update
      @work = Work.find(params[:id])
      if @work.update(work_params)
        redirect_to works_path(@work), alert: "更新しました"
      else
        render 'edit'
      end
    end
  
    def send_mail
      @work = Work.find(params[:id])
      @work.update(send_mail_flag: true)
      WorkMailer.client_email(@work).deliver # 全企業に送信
      redirect_to work_path(@work), alert: "送信しました"
    end

    private
    def work_params
      params.require(:work).permit(
        :name,  #フルネーム
        :tel, #電話番号
        :address,
        :email, #メールアドレス
        :program_histroy, #プログラム歴
        :program_python, #Python歴
        :program_other, #使用可能言語
        :period, #いつから働きたい
        :remarks, #要望
        :gender, #性別
        :age, #年齢
        :education, #学歴
        :histroy, #職務経歴
        :work_now, #現在の仕事
        :engineer_level, #エンジニアレベル
        :nationality, #国籍
        :japanese_level, #日本語レベル
        :conversion, #成果報酬
        :visa, #what king of visa
        :hope, #その他希望
        :recommendation, #推薦
        :pr,
        :qualification,
        :image,
      )
    end
  end
  