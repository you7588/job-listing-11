class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @resumes = Resume.all
  end

  def show
    @resume = Resume.find(params[:id])
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

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to resumes_path
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    flash[:warning] = "删除成功"
    redirect_to resumes_path
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
