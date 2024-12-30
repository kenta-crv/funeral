class WorksController < ApplicationController
    before_action :authenticate_admin!, only: [ :edit, :update, :destroy, :send_mail]
    before_action :set_work, only: [:contracts, :send_contracts]
    def index
      @works = Work.without_ng_status.order(created_at: :desc).page(params[:page])
      @contracts = Contract.all
      @work = @works.first # デフォルトで最初のworkを設定
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

  # モーダル用: 紹介可能なContractの取得
  def contracts
    #@work = Work.find(params[:id]) # URLからWork IDを取得
    @contracts = Contract.all
    respond_to do |format|
      format.js
    end
  end
  
  def send_bulk_email
    work_id = params[:work_id] # works/:id を取得
    contract_ids = params[:contract_ids] # 選択された contracts/:id を取得
  
    if work_id.present? && contract_ids.present?
      work = Work.find(work_id) # 送信元の work を固定
      contracts = Contract.where(id: contract_ids)
  
      contracts.each do |contract|
        ContractMailer.with(contract: contract, work: work).send_contract_email.deliver_now
      end
  
      flash[:notice] = "#{contracts.size}件のメールを送信しました。"
    else
      flash[:alert] = "送信に必要な情報が不足しています。"
    end
  
    redirect_to work_path(work_id)
  end

  def send_contracts
    selected_contracts = Contract.where(id: params[:contract_ids])
    # 選択されたContractの処理をここで実装
    selected_contracts.each do |contract|
      # 例: メール送信やログ出力
      Rails.logger.info "Processing contract ID: #{contract.id}, Company: #{contract.co}"
    end
    flash[:notice] = "選択された契約が処理されました。"
    redirect_to works_path
  end  

  # 紹介済み企業一覧
  def introduced
    @works = Work.where(introduced: true)
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

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
        :introduced
      )
    end
  end
  