class HomeController < ApplicationController
  def index
    @categories = Category.all
    @recent_posts = Post.includes(:category).recent.limit(10)
  end
end
