class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  skip_before_filter :require_login, only: [:new, :create]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params)
    @user = User.new(user_params)

    if @user.save
      auto_login @user
      redirect_to :root, notice: 'Your account was created successfully!'
    else
      render action: 'new'
    end
  end

  def update
    # your code codes here
    @user = User.find(params[:id])
    #@post = current_user.posts.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'User successfully updated'
    else
      render action: 'edit'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password)
  end
end
