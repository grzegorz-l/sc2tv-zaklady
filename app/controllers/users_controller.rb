class UsersController < ApplicationController
  before_filter :authenticate_admin!, :except => :show
  layout "admin_panel"
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
    @user = current_user
  end


end
