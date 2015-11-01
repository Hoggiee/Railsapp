class PostsController < ApplicationController
    
    before_action :set_post, only: [:show]

    def index
        @posts = Post.all
    end
    
    def show
        respond_to do |format|
           format.html
           format.json
        end    
    end
    
    def set_post
        @post = Post.find(params[:id])  
    end
    
end
