class WelcomeController < ApplicationController
  skip_before_filter :require_login, only: :home
  #skip_before_filter only: :home

  def index
  	#binding.pry
  	@posts = Post.includes(:user)
  rescue
  	binding.pry
    # this should not happen...
  	nil
  end
end
