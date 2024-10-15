class ProgressesController < ApplicationController
  def create
    @work = Work.find(params[:work_id])
    @progress = @work.progresses.new(progress_params)

    if @progress.save
      redirect_to work_path(@work), notice: '進捗が追加されました。'
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:work_id])
    @progress = @work.progresses.find(params[:id])
  end

  def update
    @work = Work.find(params[:work_id])
    @progress = @work.progresses.find(params[:id])
    if @progress.update(progress_params)
      redirect_to work_path(@work), notice: '進捗が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:work_id])
    @progress = @work.progresses.find(params[:id])
    @progress.destroy
    redirect_to work_path(@work), notice: '進捗が削除されました。'
  end

  private

  def progress_params
    params.require(:progress).permit(:status, :next, :body)
  end
end
