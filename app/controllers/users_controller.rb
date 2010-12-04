class UsersController < ApplicationController
  before_filter :authenticate_admin!, :except => :show
  
  def index
    @users = User.all
  end
  
  def show
<<<<<<< HEAD
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
=======
    @user = current_user
>>>>>>> f1ed896c65919abd0878f6063e33466881653861
  end
end
