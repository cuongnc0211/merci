class CategoriesController < ApplicationController
  before_action :category, only: :show

  def show
    @posts = @category.posts.order(created_at: :desc).page(params[:page]).per Settings.paginate.default
  end

  private

  def category
    @category = Category.find(params[:id])
  end
end
