class PagesController < ApplicationController
    
    
    def index
        @posts = Post.all.limit(4).order(created_at: :desc)
    end
    
    def show
        respond_to do |format|
           format.html
           format.json
        end    
    end
    
    def load_more_posts
        @posts = Post.where("id < ?", params[:lowest_id]).limit(3).order(created_at: :desc)
        render :layout => false
    end
end
