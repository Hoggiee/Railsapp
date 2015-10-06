class PagesController < ApplicationController
    
    def index
        @posts = Post.all.limit(6)
    end
    
end
