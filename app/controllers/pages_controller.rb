class PagesController < ApplicationController
    
    def index
        @posts = Post.all.limit(6)
    end
    
    def load_more_posts
        @posts = Post.all
        respond_to do |format|
           format.html
           format.json
        end  
    end
end
