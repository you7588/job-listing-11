class ResumesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user

    if @resume.save
      flash[:notice] = "成功提交履历"
      redirect_to resumes_path
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
