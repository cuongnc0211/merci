class TopPageController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per Settings.paginate.top_page
  end
end
