class UsersController < ApplicationController

  before_action :logon_check, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end
  
  def update
  
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "ユーザ情報を更新しました"
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
    
  def logon_check
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
  
end
