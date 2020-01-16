class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :add_like]
  before_action :foreign_keys, only: [:new, :edit]

  def index
    @posts = Post.all
  end

  def show
    @blogger = @post.blogger
    @destination = @post.destination 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to post_path(@post.id)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
    
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to post_path(@post.id)
  end

  def add_like
    @post.likes += 1
    @post.save

    redirect_to post_path(@post.id)
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def foreign_keys
    @bloggers = Blogger.all
    @destinations = Destination.all
  end
end
