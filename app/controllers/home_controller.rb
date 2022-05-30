class HomeController < ApplicationController
  def index
    @posts = Post.preload(:votes_for, :user).page(params[:page]).per(10)
  end
end
