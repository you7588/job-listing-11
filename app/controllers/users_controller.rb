class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "修改成功"
      redirect_to user_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:time_zone, :profile_attributes => [:id, :legal_name, :username, :birthday, :location, :motto, :wechat])
  end

  def find_user
    @user = current_user
    @user.create_profile unless @user.profile
  end

end
