class PostsController < ApplicationController
    
    
    def index
        @posts = Post.all
    end
    
    def show
        respond_to do |format|
           format.html 
        end    
    end
    
end
