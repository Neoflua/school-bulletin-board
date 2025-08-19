class SearchController < ApplicationController
  def index
    @query = params[:q]
    @category_id = params[:category_id]
    
    if @query.present?
      @posts = Post.includes(:category, :comments)
                   .where("title LIKE ? OR content LIKE ?", "%#{@query}%", "%#{@query}%")
      
      if @category_id.present?
        @posts = @posts.where(category_id: @category_id)
      end
      
      @posts = @posts.recent.page(params[:page]).per(20)
    else
      @posts = Post.none
    end
    
    @categories = Category.all
  end
end
