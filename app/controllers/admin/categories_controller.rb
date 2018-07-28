class Admin::CategoriesController < Admin::BaseController
  before_action :category, except: [:index, :new, :create]

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    if Category.create category_params
      flash[:success] = t ".created"
      redirect_to admin_categories_path
    else
      flash[:error] = t ".creat_fails"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".updated"
      redirect_to admin_categories_path
    else
      flash[:error] = t ".update_fail"
      render :edit
    end
  end

  def delete
    if @category.update_attributes category_params
      flash[:success] = t ".deleted"
    else
      flash[:error] = t ".deleted_fail"
    end
    redirect_to admin_categories_path
  end

  private

  def category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit Category::CATEGORY_ATRIBUTES
  end
end
