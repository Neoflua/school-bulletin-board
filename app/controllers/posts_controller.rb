class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:index, :new, :create]

  def index
    @posts = @category.posts.includes(:comments).recent.page(params[:page]).per(20)
  end

  def show
    @comments = @post.comments.recent
    @comment = Comment.new
  end

  def new
    @post = @category.posts.build
  end

  def create
    @post = @category.posts.build(post_params)
    
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to category_path(@post.category), notice: '投稿が削除されました。'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def post_params
    params.require(:post).permit(:title, :content, :author_name, :anonymous)
  end
end
