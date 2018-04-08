class Admin::PostsController < Admin::BaseController
  before_action :post, only: [:edit, :update, :delete]

  def new
    @post = Post.new
  end

  def create
    if Post.create post_params
      flash[:success] = t ".created"
      redirect_to admin_root_path
    else
      flash[:errors] = t ".create_fail"
      render :new
    end
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t ".updated"
      redirect_to admin_root_path
    else
      flash[:errors] = t ".update_fail"
      render :edit
    end
  end

  def delete
    if @post.destroy
      flash[:success] = t ".deleted"
    else
      flash[:errors] = t ".delete_fail"
    end

    redirect_to admin_post_index_path
  end

  def index
    @posts = Post.all.order created: :desc
  end

  private
  def post_params
    params.require(:post).permit Post::POST_ATRRIBUTES
  end

  def post
    @post = Post.find_by id: params[:id]
  end
end
