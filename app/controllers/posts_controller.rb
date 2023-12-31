class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :change_status]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:categories, :user, :comments).all
    @posts = Post.order(created_at: :desc)
    @posts = @posts.where(title: params[:title]) if params[:title].present?
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @posts = @posts.where(created_at: start_date..end_date)
    end
    if params[:published].present?
      @posts = @posts.where(published: '1' == params[:published])
    end

    if params[:status].present?
      @posts = @posts.where(status: params[:status])
    end

    @posts = @posts.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post create failed'
      render :new, status: :unprocessable_entity
    end

  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = 'Post update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  def change_status
    new_status = params[:new_status].to_i

    if @post.update(status: new_status)
      flash[:notice] = 'Status changed successfully'
    else
      flash[:alert] = 'Failed to change the status'
    end

    redirect_to posts_path
  end

  private

  def validate_post_owner
    unless @post.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to posts_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published,:status, :image, :address, :address_region_id, :address_province_id,
                                 :address_city_id, :address_barangay_id, category_ids: [])
  end

end

