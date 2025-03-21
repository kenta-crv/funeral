class ContractsController < ApplicationController
    #before_action :authenticate_admin!, only: [:index, :destroy, :send_mail]  
    def index
      @contracts = Contract.without_ng_status.order(created_at: :desc).page(params[:page])
    end
  
    def new
      @contract = Contract.new
    end

    def confirm
      @contract = Contract.new(contract_params)
    end
  
    def thanks
      @contract = Contract.new(contract_params)
      @contract.save
      if admin_signed_in?
        ContractMailer.received_email(@contract).deliver # 管理者に通知
        flash[:notice] = "管理者送信のため、取引先にはメールを送らず完了しました。"
      else
        # 一般ユーザーの場合はメール送信を行う
        ContractMailer.received_email(@contract).deliver # 管理者に通知
        ContractMailer.send_email(@contract).deliver # 送信者に通知
      end
    end
  
    def create
      @contract = Contract.new(contract_params)
      @contract.save
      redirect_to thanks_contracts_path
    end
    #def create
     # @contract = Contract.new(contract_params)
     # if @contract.save
     #   if admin_signed_in?
     #     ContractMailer.received_email(@contract).deliver # 管理者に通知
     #     flash[:notice] = "管理者送信のため、取引先にはメールを送らず完了しました。"
        #else
          # 一般ユーザーの場合はメール送信を行う
          #ContractMailer.received_email(@contract).deliver # 管理者に通知
          #ContractMailer.send_email(@contract).deliver # 送信者に通知
     #   end
     #   redirect_to contracts_path, notice: "契約が正常に作成されました。"
     # else
     #   flash.now[:alert] = "入力内容にエラーがあります。"
     #   render :new
     # end
    #end
    
      def show
        @contract = Contract.find(params[:id])
        @comment = Comment.new
      end
    
      def edit
        @contract = Contract.find(params[:id])
      end
  
      def info
        @contract = Contract.find(params[:id])
      end
    
      def conclusion
        @contract = Contract.find(params[:id])
        today = Date.today.strftime("%Y-%m-%d")
      end
  
      def destroy
        @contract = Contract.find(params[:id])
        @contract.destroy
        redirect_to contracts_path, alert:"削除しました"
      end
  
      def send_mail
        @contract = Contract.find(params[:id])
        ContractMailer.received_first_email(@contract).deliver_now
        ContractMailer.send_first_email(@contract).deliver_now
        redirect_to info_contract_path(@contract), notice: "#{@contract.co}へ契約依頼のメール送信を行いました。"
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
    
      def update
        @contract = Contract.find(params[:id])
        was_agreed = @contract.agree # 現在の agree の値を保存
      
        if @contract.update(contract_params)
          if @contract.agree == "同意しました" && was_agreed != "同意しました"
            # agree が新たに "同意しました" に変更された場合のみメール送信
            ContractMailer.contract_received_email(@contract).deliver_now
            ContractMailer.contract_send_email(@contract).deliver_now
            flash[:notice] = "契約が完了しました。メールにて控えをお送りしております。"
          end
          redirect_to info_contract_path(@contract)
        else
          # 更新が失敗した場合の処理
          render :edit
        end
      end
          
      private
      def contract_params
        params.require(:contract).permit(
          :name, #申込者様姓
          :tel, #電話番号
          :address, #住所
          :email, #メールアドレス
          :fenural, #葬儀の最安値
          :firty_nine, #四九日の最安値
          :each_submit, #死亡届の提出
          :each_cancel, #保険や年金の解約
          :card_cancel, #銀行口座やカードの解約
          :hope_contact, #参列者への参加依頼連絡
          :inheritance, #相続の法的対応
          :tidying_up, #片付け対応
          :situation, #ご状況
          :work_id)
      end
  end
  