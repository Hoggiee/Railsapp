class Admin::CategoriesController < AdminController
    
    before_action :set_category, :only =>[:show, :edit, :destroy, :update]
    
    def index
        @categories = Category.all
        respond_to do |format|
            format.html
            format.json {render json: @categories}
        end
    end
    
    def show
        respond_to do |format|
           format.html
           format.json { render json: @category }
        end    
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        
        respond_to do |format|
            if @category.save
                format.html {redirect_to admin_categories_path, notice: 'Category created'}
            else
                format.html {render action: 'new', alert: 'Error while creating'}
            end
        end    
    end
    
    def edit

    end
    
    def update
        
        respond_to do |format|
            if @category.update{post_params}
                format.html {redirect_to admin_post_path, notice: "Category updated"}
            else
                format.html {render action: 'edit', alert: "Error while editing"}
            end
        end  
        
    end
    
    def destroy 
     if @category.delete
          redirect_to admin_categories_path, notice: "Category Deleted"
      else
        redirect_to admin_categories_path, notice: "Error while deleting"
     end
    end
    
    protected
    
    def set_category
        @category = Category.find(params[:id])  
    end
    
    
    def category_params
        params.require(:category).permit(:name)
    end
    
    
    
end

