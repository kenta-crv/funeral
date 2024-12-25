class CommentsController < ApplicationController
    def create
      @contract = Contract.find(params[:contract_id])
      @comment = @contract.comments.new(comment_params)
      
      if @comment.save
        ContractMailer.new_comment_notification(@comment).deliver_now
        redirect_to contract_path(@contract), notice: 'コメントを更新しました。'
      else
        render :new
      end
    end    
  
    def edit
      Rails.logger.debug "PARAMS: #{params.inspect}" # デバッグ出力
      @contract = Contract.find(params[:contract_id])
      @comment = Comment.find(params[:id])
    end
  
    def destroy
      Rails.logger.debug "PARAMS: #{params.inspect}" # パラメータを確認
      @contract = Contract.find(params[:contract_id])
      Rails.logger.debug "@contract: #{@contract.inspect}" # Contract を確認
      @comment = @contract.comments.find(params[:id]) # params[:id] を確認
      Rails.logger.debug "@comment: #{@comment.inspect}" # Comment を確認
      @comment.destroy
      redirect_to contract_path(@contract), notice: 'コメントを削除しました。'
    end
  
    def update
      @contract = Contract.find(params[:contract_id])
      @comment = @contract.comments.find(params[:id])
      if @comment.update(comment_params)
         redirect_to contract_path(@contract)
      else
          render 'edit'
      end
    end
  
    private
    def comment_params
       params.require(:comment).permit(
          :status,
          :next,
          :body,
      )
    end
  end
  