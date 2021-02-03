class Admin::CategoriesController < Admin::BaseController
  before_action :find_category ,only:[:destroy,:edit]
  def  index
    @categories=Category.order(position: :asc)
  end
  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_param)
    
    if  @category.save
      redirect_to admin_categories_path,notice: '新增分類成功'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path,notice: '新增分類成功'
  end

  private
  def category_param
    params.require(:category).permit(:name)
  end

  def find_category
     @category=Category.find(params[:id])
  end
end
