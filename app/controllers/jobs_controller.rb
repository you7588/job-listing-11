class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index

    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC')
    # when 'by_upper_bound'
    #   Job.published.order('wage_upper_bound DESC')
    when 'by_recent'
      Job.published.recent
    else
      Job.published.freedom
    end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path, alert: "delete success"
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update success!~"
    else
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:logo, :remove_logo, :title, :description, :wage_upper_bound, :wage_lower_bound,
    :is_hidden, :source, :scale, :job_experience, :education_background, :skill, :company,
    :financing_stage, :industry, :status, :city_id, :release)
  end

end
