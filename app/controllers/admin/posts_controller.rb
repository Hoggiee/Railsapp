class Admin::PostsController < AdminController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index 
    @posts = Post.all
  end

  
  def show
  end

  def new
    @post = Post.new
  end

  def create
     @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "Post created"
    else
      render action: "new"
    end
  end

  def edit
    
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to admin_posts_path, notice: "Post updated"
    else
      render action: "edit"
    end
  end

  def destroy 
    if @post.delete
      redirect_to admin_posts_path, notice: "Post deleted"
    else
      redirect_to admin_posts_path, notice: "Error while deleting"
    end
  end

  protected

  def set_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
