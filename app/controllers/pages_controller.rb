class PagesController < ApplicationController
    
    def index
        @posts = Post.all.limit(6)
    end
    
    def load_more_posts
        respond_to do |format|
           format.json
        end
    end
end
