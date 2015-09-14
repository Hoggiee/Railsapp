class Admin::PostsController < AdminController
    
    before_action :get_post, :only =>[:show, :edit, :destroy, :update]
    
    def index
        @posts = Post.all
        respond_to do |format|
            format.html #index.html
            format.json {render json: @posts}
        end
    end
    
    def show
        respond_to do |format|
           format.html
           format.json {render json: @post}
        end    
    end
    
    def new
        @post = Post.new
    end
    
    def create
     @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: "Dodano projekt"
    else
      render action: "new"
    end
  end
    
    def edit

    end
    
    def update
        
        respond_to do |format|
            if @post.update{post_params}
                format.html {redirect_to admin_post_path, notice: "Post updated"}
            else
                format.html {render action: 'edit', alert: "Error while editing"}
            end
        end  
        
    end
    
    def destroy
        @post.destroy
        respond_to do |format|
            format.html {redirect_to admin_posts_path, notice: "#{Post.title} deleted"}
        end    
    end
    
    protected
    
    def get_post
        @post = Post.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
 end   

