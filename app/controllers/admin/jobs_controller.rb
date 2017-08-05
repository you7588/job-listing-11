class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]
  before_action :require_is_admin
  layout "admin"

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to admin_jobs_path
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!

    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!

    redirect_to :back
  end

  def bulk_update
    total = 0
    Array(params[:ids]).each do |job_id|
      job = Job.find(job_id)

      if params[:commit] == I18n.t(:bulk_update)
        job.status = params[:job_status]
        if job.save
          total += 1
        end
      elsif params[:commit] == I18n.t(:bulk_delete)
        job.destroy
        total += 1
      end
    end
       flash[:alert] = "成功完成#{total}笔"
        redirect_to admin_jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound,
    :is_hidden, :source, :scale, :job_experience, :education_background, :skill, :company,
    :financing_stage, :industry, :status, :city_id, :release)
  end
end
