class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(name: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category created!"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
