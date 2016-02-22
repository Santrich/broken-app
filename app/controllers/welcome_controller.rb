class WelcomeController < ApplicationController
  skip_before_filter :require_login, only: :home

  # def index # original definition
  def index
    @posts = Post.includes(:user)
    # @posts = User.find(params[:user_id]).posts # a call from posts_controller.rb
  rescue
    # this should not happen...
    nil
  end
end
