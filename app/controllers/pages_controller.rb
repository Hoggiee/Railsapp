class PagesController < ApplicationController
    
    
    def index
        @posts = Post.all.limit(4)
    end
    
    def load_more_posts
        @posts = Post.where("id > ?", params[:highest_id]).limit(3)
        render :layout => false
    end
end
