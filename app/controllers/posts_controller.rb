class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end


  def create
  	@post = Post.new(post_params)
=begin  	@post.title = params[:title]
  	@post.body = params[:body]
=end
  	@post.save
  	redirect_to post_path(@post)
  end

  def index
  	@post = Post.all
  end

  def show
=begin  	@post = Post.find(params[:id])
=end
  end

  def edit
=begin  	@post = Post.find(params[:id])
=end
  end

  def update
=begin  	@post = Post.find(params[:id])
=end
=begin    @post.title = params[:title]
    @post.body = params[:body]
    @post.save
=end    
# updateメソッドでsaveまでやってくれる。
# updateメソッドは引数にハッシュを取ることができる
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
=begin  	@post = Post.find(params[:id])
=end
  	@post.destroy
    redirect_to posts_path
  end

  private def set_post
  	@post = Post.find(params[:id])
  end

  private def post_params
  	params.require(:post).permit(:title,:body)
  end


end
