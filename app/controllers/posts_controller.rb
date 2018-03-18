class PostsController < ApplicationController
  before_action :post, only: :show
  layout "post/application", only: :show
  
  def show
  end

  private
  def post
    @post = Post.find params[:id]
  end
end
