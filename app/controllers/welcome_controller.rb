class WelcomeController < ApplicationController
  skip_before_filter :require_login, only: :index
  #skip_before_filter only: :home

  def index
  	@posts = Post.includes(:user)	
  end
end
