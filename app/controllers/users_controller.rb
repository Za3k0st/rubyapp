class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "default"
    if @user.save
      redirect_to @user
      flash[:notice] = 'User created'
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:danger] = "User deleted"
      redirect_to users_path
    else
      flash[:danger] = "Suppression réussi"
      render users_path
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :country_id)
  end
end
