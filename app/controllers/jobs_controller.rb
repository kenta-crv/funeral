class JobsController < ApplicationController
    before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]
  
    def index
      @jobs = Job.order(created_at: "DESC").page(params[:page])
    end
  
    def new
      @job = Job.new
    end

    def thanks
    end
  
    def create
      @job = Job.new(job_params)
      if @job.save
        redirect_to thanks_jobs_path#(@job) 
      else
        render 'new'
      end
    end
  
    def show
      @job = Job.find(params[:id])
    end
  
    def edit
      @job = Job.find(params[:id])
    end
  
    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to jobs_path, alert:"削除しました"
    end
  
    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        redirect_to job_path(@job), alert: "更新しました" 
      else
        render 'edit'
      end
    end

    private
    def job_params
      params.require(:job).permit(
        :front_of_engineer,
        :backend_of_engineer,
        :serverside_of_engineer,
        :application_of_engineer,
        :database_of_engineer,
        :security_of_engineer,
        :your_hope,
  
        :python,
        :python_history,
        :ruby,
        :ruby_history,
        :java,
        :java_history,
        :c_language,
        :c_language_history,
        :go,
        :go_history,
        :php,
        :php_history,
        :javascript,
        :javascript_history,
        :swift,
        :swift_history,
        :kotlin,
        :kotlin_history,
  
        :other_1,
        :other_1_history,
        :other_2,
        :other_2_history,
        :other_3,
        :other_3_history,
  
        :full_time_employee,
        :full_time_employee_remotely,
        :freelance,
        :freelance_remotely,
        :part_time,
        :part_time_remotely,
        :period,
        :line,
        :line_id
      )
    end
  end
  