class HomeController < ApplicationController
  def index
    @posts = Post.preload(:votes_for, :user)
  end
end
